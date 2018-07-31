Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MIME_HTML_MOSTLY,RCVD_IN_DNSWL_HI,TVD_SPACE_RATIO,T_TVD_MIME_EPI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D1CE7D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 10:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbeGaLtM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 07:49:12 -0400
Received: from mail4.tencent.com ([183.57.53.109]:51479 "EHLO
        mail4.tencent.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732045AbeGaLtL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jul 2018 07:49:11 -0400
X-Greylist: delayed 405 seconds by postgrey-1.27 at vger.kernel.org; Tue, 31 Jul 2018 07:49:10 EDT
Received: from EXHUB-SZMail01.tencent.com (unknown [10.14.6.21])
        by mail4.tencent.com (Postfix) with ESMTP id EA3F08AA84;
        Tue, 31 Jul 2018 18:02:50 +0800 (CST)
Received: from EXMBX-SZMAIL013.tencent.com ([fe80::3013:8058:3145:a257]) by
 EXHUB-SZMail01.tencent.com ([::1]) with mapi id 14.03.0408.000; Tue, 31 Jul
 2018 18:02:49 +0800
From:   =?gb2312?B?anV2aWxpdSjB9bzSzsQp?= <juviliu@tencent.com>
To:     "corbet@lwn.net" <corbet@lwn.net>
CC:     "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "mhocko@suse.com" <mhocko@suse.com>,
        "vbabka@suse.cz" <vbabka@suse.cz>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "rppt@linux.vnet.ibm.com" <rppt@linux.vnet.ibm.com>,
        "laoar.shao@gmail.com" <laoar.shao@gmail.com>,
        "kemi.wang@intel.com" <kemi.wang@intel.com>,
        "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: update document's __vm_enough_memory function path
Thread-Topic: update document's __vm_enough_memory function path
Thread-Index: AdQotYuUKp8oWjMARMWc9fgCAKy7vA==
Date:   Tue, 31 Jul 2018 10:02:49 +0000
Message-ID: <E18EDF4A4FA4A04BBFA824B6D7699E532A7E5913@EXMBX-SZMAIL013.tencent.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.34.243.34]
Content-Type: multipart/mixed;
        boundary="_004_E18EDF4A4FA4A04BBFA824B6D7699E532A7E5913EXMBXSZMAIL013t_"
MIME-Version: 1.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--_004_E18EDF4A4FA4A04BBFA824B6D7699E532A7E5913EXMBXSZMAIL013t_
Content-Type: multipart/alternative;
	boundary="_000_E18EDF4A4FA4A04BBFA824B6D7699E532A7E5913EXMBXSZMAIL013t_"

--_000_E18EDF4A4FA4A04BBFA824B6D7699E532A7E5913EXMBXSZMAIL013t_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

DQo=

--_000_E18EDF4A4FA4A04BBFA824B6D7699E532A7E5913EXMBXSZMAIL013t_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:=B5=C8=CF=DF;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:=B5=C8=CF=DF;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_E18EDF4A4FA4A04BBFA824B6D7699E532A7E5913EXMBXSZMAIL013t_--

--_004_E18EDF4A4FA4A04BBFA824B6D7699E532A7E5913EXMBXSZMAIL013t_
Content-Type: application/octet-stream;
	name="0001-update-document-s-__vm_enough_memory-function-path.patch"
Content-Description: 0001-update-document-s-__vm_enough_memory-function-path.patch
Content-Disposition: attachment;
	filename="0001-update-document-s-__vm_enough_memory-function-path.patch";
	size=882; creation-date="Fri, 06 Jul 2018 18:20:09 GMT";
	modification-date="Fri, 06 Jul 2018 18:20:09 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxMmM0MmQ2ZTA4YWQyZTYzOGQxOWY4ZmZiYmUwNGI2OWFkNTlhYTU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBqdXZpIDxqdXZpbGl1QHRlbmNlbnQuY29tPgpEYXRlOiBGcmks
IDYgSnVsIDIwMTggMDk6MDM6NDIgLTA5MDAKU3ViamVjdDogW1BBVENIXSB1cGRhdGUgZG9jdW1l
bnQncyBfX3ZtX2Vub3VnaF9tZW1vcnkgZnVuY3Rpb24gcGF0aAoKX192bV9lbm91Z2hfbWVtb3J5
IGhhcyAgbW92ZWQgdG8gbW0vdXRpbC5jCgpTaWduZWQtb2ZmLWJ5OiBKdXZpIExpdSA8anV2aWxp
dUB0ZW5jZW50LmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL3N5c2N0bC92bS50eHQgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL3N5c2N0bC92bS50eHQgYi9Eb2N1bWVudGF0aW9uL3N5c2N0bC92bS50
eHQKaW5kZXggNjk3ZWY4YzIyNWRmLi42YjcxMzg4ZWFkMjMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vc3lzY3RsL3ZtLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL3N5c2N0bC92bS50eHQKQEAg
LTY2OCw3ICs2NjgsNyBAQCBhbmQgZG9uJ3QgdXNlIG11Y2ggb2YgaXQuCiBUaGUgZGVmYXVsdCB2
YWx1ZSBpcyAwLgogCiBTZWUgRG9jdW1lbnRhdGlvbi92bS9vdmVyY29tbWl0LWFjY291bnRpbmcu
cnN0IGFuZAotbW0vbW1hcC5jOjpfX3ZtX2Vub3VnaF9tZW1vcnkoKSBmb3IgbW9yZSBpbmZvcm1h
dGlvbi4KK21tL3V0aWwuYzo6X192bV9lbm91Z2hfbWVtb3J5KCkgZm9yIG1vcmUgaW5mb3JtYXRp
b24uCiAKID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09CiAKLS0gCjIuMTEuMAoK

--_004_E18EDF4A4FA4A04BBFA824B6D7699E532A7E5913EXMBXSZMAIL013t_--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
