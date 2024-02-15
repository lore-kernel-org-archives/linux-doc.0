Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D22BA37
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 06:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707979286; cv=none; b=ZTXmxqXTWEpi5rRAkVROlfLxJpn69I4/RzT5VBruGuotrmt4Bq5b5S2UHbLqs6VKdyUD+Ahq17gjbII/uNxk6KYTFM8Avkw7I/YPalDo/q5zgFej7zCXshboEEqK/tlDYkXFlUTrocbDyY8o98J+NMrzxjVBRuMrUJN94SIWD8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707979286; c=relaxed/simple;
	bh=1JI+NvvPPx0mKVRQGP1iGBRIZHBmDWgrRWO1W6B95uE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CspJYwagT+DuREla19NR7xM8ERboVOCgQU2FxKeEwNwyq5bcPtM4Ewb7cDBRoeHlf7jfmP0lMjMaTXHA52M4JJ2EVppZxx/O7wbGy8eWqHx+o8RIJM6tU2YKZjanY0ifJQnpQGINSqrByeznf2A5e60b+fdrgk2pCNB4h7zYy0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EegriTCn; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EegriTCn"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41EMhukE007049;
	Thu, 15 Feb 2024 06:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=RibD2ymXoVa0vnJk0htb0vf7Cs8s/HYLVETgjZZCq3M=;
 b=EegriTCnT/+xwAV4VmBZgYbj3b7P3SKzcqp8DnfQS4CMHBanSWGsCawCtU/rs1MdDmhp
 BaUxUDYWituJYDP7DTLOAEzOmerFm3X7OZtCkxsG5vk5GxT2SUmum0Hkzy4unu67KwyY
 H9JihMjVRXprde5KoQFkEuFHm1IMAt1k8LzQsg8HsOLQLJ9bmoEfM+ixq7L7AAgsbFH2
 Ou6UGc44ysqiFdvGJDwxaiRkPFOvXYRXWZYHtbM9IUCGA9NWdSR9wPxhZpuY822b6Aez
 6mlV4KyH+DcyRpcyalzLn/G2DeyQb6/NX2lUU956lItbzCMIZPQDp9uOLhDpUAj7q/fn Ug== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w92db16g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 06:41:21 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41F5G6rU024690;
	Thu, 15 Feb 2024 06:41:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w5ykgbk0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 06:41:16 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41F6fG2N001537;
	Thu, 15 Feb 2024 06:41:16 GMT
Received: from localhost.localdomain (dhcp-10-175-43-240.vpn.oracle.com [10.175.43.240])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w5ykgbk09-1;
	Thu, 15 Feb 2024 06:41:15 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
        Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs: translations: use attribute to store current language
Date: Thu, 15 Feb 2024 07:41:09 +0100
Message-Id: <20240215064109.1193556-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_06,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150049
X-Proofpoint-GUID: gTAOHlwRMR7WANMWOlxzEyZU2oab3uWx
X-Proofpoint-ORIG-GUID: gTAOHlwRMR7WANMWOlxzEyZU2oab3uWx

Akira Yokosawa reported [1] that the "translations" extension we added in
commit 7418ec5b151f ("docs: translations: add translations links when they
exist") broke the build on Sphinx versions v6.1.3 through 7.1.2 (possibly
others) with the following error:

    Exception occurred:
      File "/usr/lib/python3.12/site-packages/sphinx/util/nodes.py", line 624, in _copy_except__document
        newnode = self.__class__(rawsource=self.rawsource, **self.attributes)
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    TypeError: LanguagesNode.__init__() missing 1 required positional argument: 'current_language'
    The full traceback has been saved in /tmp/sphinx-err-7xmwytuu.log, if you want to report the issue to the developers.

Solve this problem by making 'current_language' a true element attribute
of the LanguagesNode element, which is probably the more correct way to do
it anyway.

Tested on Sphinx 2.x, 3.x, 6.x, and 7.x.

[1]: https://lore.kernel.org/all/54a56c2e-a27c-45a0-b712-02a7bc7d2673@gmail.com/

Fixes: 7418ec5b151f ("docs: translations: add translations links when they exist")
Reported-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/sphinx/translations.py | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/sphinx/translations.py b/Documentation/sphinx/translations.py
index 47161e6eba99..32c2b32b2b5e 100644
--- a/Documentation/sphinx/translations.py
+++ b/Documentation/sphinx/translations.py
@@ -29,10 +29,7 @@ all_languages = {
 }
 
 class LanguagesNode(nodes.Element):
-    def __init__(self, current_language, *args, **kwargs):
-        super().__init__(*args, **kwargs)
-
-        self.current_language = current_language
+    pass
 
 class TranslationsTransform(Transform):
     default_priority = 900
@@ -49,7 +46,8 @@ class TranslationsTransform(Transform):
             # normalize docname to be the untranslated one
             docname = os.path.join(*components[2:])
 
-        new_nodes = LanguagesNode(all_languages[this_lang_code])
+        new_nodes = LanguagesNode()
+        new_nodes['current_language'] = all_languages[this_lang_code]
 
         for lang_code, lang_name in all_languages.items():
             if lang_code == this_lang_code:
@@ -84,7 +82,7 @@ def process_languages(app, doctree, docname):
 
         html_content = app.builder.templates.render('translations.html',
             context={
-                'current_language': node.current_language,
+                'current_language': node['current_language'],
                 'languages': languages,
             })
 
-- 
2.34.1

