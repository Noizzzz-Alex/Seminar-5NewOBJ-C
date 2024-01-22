//
//  DataSaverToFile.m
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 23.01.2024.
//

#import "DataSaverToFile.h"

@implementation DataSaverToFile

+ (NSURL*)saveDataToFile:(NSArray *)array {
    
    NSString *nameFolder = [NSString stringWithFormat:@"%@Folder", array[0]];
    NSString *nameFile = [NSString stringWithFormat:@"%@File", array[0]];
    NSString *dateToString = [NSString stringWithFormat:@"%@,%@,%@",array[0],array[1],array[2]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //URL-адрес для директории "Документы" в домене текущего пользователя
    NSURL *urlPath = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    
    //folderURL - это объект NSURL, который представляет URL-адрес папки, полученный путем добавления компонента nameFolder к urlPath. Метод URLByAppendingPathComponent: добавляет указанный компонент к текущему URL-адресу и возвращает новый URL-адрес
    NSURL *folderURL = [urlPath URLByAppendingPathComponent:nameFolder];
    
    
    //pathOfData - это объект NSURL, который представляет URL-адрес файла, полученный путем добавления компонента nameFile к folderURL. Также используется метод URLByAppendingPathComponent: для добавления компонента к текущему URL-адресу.
    NSURL *pathOfData = [folderURL URLByAppendingPathComponent:nameFile];
    
    //data - это объект NSData, который содержит данные, преобразованные из строки dateToString. В данном случае, строка dateToString преобразуется в данные с использованием кодировки kCFStringEncodingUTF8.
    NSData *data = [dateToString dataUsingEncoding:kCFStringEncodingUTF8];

    //если директория существует то создается файл с именем nameFile
    if ([fileManager createDirectoryAtURL:folderURL withIntermediateDirectories:YES attributes:nil error:nil]) {
        [fileManager createFileAtPath:pathOfData.path contents:data attributes:nil];
        return pathOfData;
    }
    //если файл существует по указанному пути то происходит передача в Дату и оттуда в строку
//    if ([fileManager fileExistsAtPath:pathOfData.path ]) {
//        NSData *tempData = [fileManager contentsAtPath:pathOfData.path];
//        NSString *tempString = [[NSString alloc]initWithData:tempData encoding:kCFStringEncodingUTF8];
//        
//        
//    }
    
    return nil;
}

+ (NSString*)readDataFromFile:(NSURL*)pathOfData {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:pathOfData.path]) {
        NSData *data = [NSData dataWithContentsOfURL:pathOfData];
        return [[NSString alloc]initWithData:data encoding:kCFStringEncodingUTF8];
    }
    return  nil;
}

@end
