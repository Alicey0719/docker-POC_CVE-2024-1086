https://github.com/Notselwyn/CVE-2024-1086

## usage
```
docker compose up -d --build
docker exec -it poc_cve_2024_1086 bash
```

## test sample
```
[tester@e23a4e5757d9 CVE-2024-1086]$ id
uid=99999(tester) gid=99999(tester) groups=99999(tester)
[tester@e23a4e5757d9 CVE-2024-1086]$ cat /etc/shadow
cat: /etc/shadow: Permission denied
[tester@e23a4e5757d9 CVE-2024-1086]$ ./exploit
...
```

 ## 結果
 - 作業していたサーバへのsshセッションが切れた
 - sshではなく、画面接続して確認すると、rootに落ちている
 - 場合によってrebootされることがある
