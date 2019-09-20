Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 442327D913
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Sep 2019 12:45:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbfITMpI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Sep 2019 08:45:08 -0400
Received: from mtax.cdmx.gob.mx ([187.141.35.197]:11225 "EHLO mtaw.cdmx.gob.mx"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725922AbfITMpI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 20 Sep 2019 08:45:08 -0400
X-NAI-Header: Modified by McAfee Email Gateway (4500)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cdmx.gob.mx; s=72359050-3965-11E6-920A-0192F7A2F08E;
        t=1568968019; h=X-Virus-Scanned:Content-Type:
         MIME-Version:Content-Transfer-Encoding:Content-Description:
         Subject:To:From:Date:Reply-To:Message-Id:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-SAAS-TrackingID:
         X-NAIMIME-Disclaimer:X-NAIMIME-Modified:X-NAI-Spam-Flag:
         X-NAI-Spam-Threshold:X-NAI-Spam-Score:X-NAI-Spam-Rules:
         X-NAI-Spam-Version; bh=p7gWlwfEWOsbONfopC
        8BPhtqdzKUJiGtXCGJ3YtSNOM=; b=YtEFfePGT0iuX2LdkJpY
        4WxuQSDauqvKRhCscVlucEmC5h9xYEaog0nFnTuLAXSOLaWoEu
        1FJzJbHCk3ZPa8j7U9vNgOHLyCZOE1eZE1hiKAZF4SEX+/JImS
        KcGpiLpMd+3FR5i8SGqL0FzytzVoTgQxYwHdLfO8uUJmFrXiUR
        k=
Received: from correo.seciti.cdmx.gob.mx (gdf-correo.cdmx.gob.mx [10.250.102.17]) by mtaw.cdmx.gob.mx with smtp
         id 1a95_118e_40807e09_25b0_4ac0_8542_e00c7effc550;
        Fri, 20 Sep 2019 03:26:58 -0500
Received: from localhost (localhost [127.0.0.1])
        by gdf-correo.df.gob.mx (Postfix) with ESMTP id E3879318A;
        Fri, 20 Sep 2019 03:26:57 -0500 (CDT)
Received: from correo.seciti.cdmx.gob.mx ([127.0.0.1])
        by localhost (gdf-correo.df.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id nOieVv4gDDZw; Fri, 20 Sep 2019 03:26:57 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
        by gdf-correo.df.gob.mx (Postfix) with ESMTP id A99C73258;
        Fri, 20 Sep 2019 03:26:57 -0500 (CDT)
X-Virus-Scanned: amavisd-new at gdf-correo.df.gob.mx
Received: from correo.seciti.cdmx.gob.mx ([127.0.0.1])
        by localhost (gdf-correo.df.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id NEJYO2Anf--L; Fri, 20 Sep 2019 03:26:57 -0500 (CDT)
Received: from [100.80.130.141] (8ta-250-0-114.telkomadsl.co.za [102.250.0.114])
        by gdf-correo.df.gob.mx (Postfix) with ESMTPSA id A66C13493;
        Fri, 20 Sep 2019 03:26:48 -0500 (CDT)
Content-Type: text/plain;
  charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Description: Mail message body
Subject: Spende von 5 Millionen Euro
To:     Recipients <mramirezg@mexicocity.gob.mx>
From:   "Shane Missler" <mramirezg@mexicocity.gob.mx>
Date:   Fri, 20 Sep 2019 10:26:54 +0200
Reply-To: "shanemissler.spende11@gmail.comshanemissler.spende11"@gmail.com
Message-Id: <20190920082648.A66C13493@gdf-correo.df.gob.mx>
X-AnalysisOut: [v=2.2 cv=crfrqxwi c=1 sm=1 tr=0 p=09-KjHS_CW8A:10 p=bEr4i4]
X-AnalysisOut: [eggGkA:10 p=Lyqu6MUUigPyaOuRX7ce:22 a=KsSCQl7LcZej77FuluUc]
X-AnalysisOut: [Qw==:117 a=vwaCKlYGupbVbBqlAPp8ng==:17 a=IkcTkHD0fZMA:10 a]
X-AnalysisOut: [=x7bEGLp0ZPQA:10 a=J70Eh1EUuV4A:10 a=pGLkceISAAAA:8 a=wN7r]
X-AnalysisOut: [T8hNlMSaUXRpxSgA:9 a=K7tsimcRO30Sg2YH:21 a=QOCYt1FwmxBrUrR]
X-AnalysisOut: [v:21 a=QEXdDO2ut3YA:10]
X-SAAS-TrackingID: 35d848d5.0.86210464.00-2375.144928431.s12p02m015.mxlogic.net
X-NAIMIME-Disclaimer: 1
X-NAIMIME-Modified: 1
X-NAI-Spam-Flag: NO
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: -5000
X-NAI-Spam-Rules: 1 Rules triggered
        WHITELISTED=-5000
X-NAI-Spam-Version: 2.3.0.9418 : core <6638> : inlines <7144> : streams
 <1833288> : uri <2907362>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

RGllcyBpc3QgZWluZSBwZXJzw7ZubGljaGUgTWFpbCwgZGllIGljaCBhbiBTaWUgYWRyZXNzaWVy
ZS4gSWNoIGJpbiBTSEFORSBNSVNTTEVSIGF1cyBGbG9yaWRhLCBVU0EuIFdpZSBTaWUgYmVyZWl0
cyB3aXNzZW4sIGhhYmUgaWNoIGVpbmVuIExvdHRvLUphY2twb3QgaW4gSMO2aGUgdm9uIDQ1MSBN
aW8uIFVTRCAoMzMwIE1pby4gR0JQKSBnZXdvbm5lbiB1bmQgZGFzIEdlbGQgaGF0IG1laW4gTGVi
ZW4gdW5kIG1laW4gRmFtaWxpZW5sZWJlbiB2ZXLDpG5kZXJ0LCBhYmVyIGVzIHdpcmQgbWVpbiBI
ZXJ6IG5pY2h0IHZlcsOkbmRlcm4sIHdpZSBpY2ggYW4gZGVtIFRhZyBzYWd0ZSwgYW4gZGVtIGlj
aCBtZWluIEdlbGQgaGFiZSwgZGFzIGljaCB2ZXJ3ZW5kZW4gd2VyZGUgRGllc2VzIEdlbGQgZsO8
ciBkaWUgSGlsZmUgZGVyIE1lbnNjaGhlaXQuIEljaCBoYWJlIGJlc2NobG9zc2VuLCBJaG5lbiB1
bmQgSWhyZXIgR2VtZWluZGUgZWluZW4gQmV0cmFnIHZvbiA1IE1pbGxpb25lbiBFdXJvIHp1IHNw
ZW5kZW4sIHVtIGRpZXNlIFNwZW5kZSBhbnp1Zm9yZGVybi4gRS1NYWlsOiAoc2hhbmVtaXNzbGVy
MEBnbWFpbC5jb20pCgpDZWNpIGVzdCB1biBjb3VycmllciBwZXJzb25uZWwgcXVlIGplIHZvdXMg
YWRyZXNzZS4gSmUgc3VpcyBTSEFORSBNSVNTTEVSLCBkZSBGbG9yaWRlLCDDiXRhdHMtVW5pcy4g
Q29tbWUgdm91cyBsZSBzYXZleiBkw6lqw6AsIGonYWkgZ2FnbsOpIDQ1MSBtaWxsaW9ucyBkZSBk
b2xsYXJzIChMb3R0byBKYWNrcG90KSBldCBsJ2FyZ2VudCBhIGNoYW5nw6kgbWEgdmllIGV0IGNl
bGxlIGRlIG1hIGZhbWlsbGUsIG1haXMgY2VsYSBuZSBjaGFuZ2VyYSBwYXMgbW9uIGPFk3VyLCBj
b21tZSBqZSBsJ2FpIGRpdCBsZSBqb3VyIG/DuSBqJ2FpIG1vbiBhcmdlbnQsIGondXRpbGlzZXJh
aSBjZXQgYXJnZW50IHBvdXIgbCdhaWRlIGRlIGwnaHVtYW5pdMOpLkonYWkgZMOpY2lkw6kgZGUg
dm91cyBkb25uZXIgbGEgc29tbWUgZGUgNSBtaWxsaW9ucyBkJ2V1cm9zIMOgIHZvdXMgZXQgw6Ag
dm90cmUgY29tbXVuYXV0w6ksIHBvdXIgcsOpY2xhbWVyIGNlIGRvbiwgZW1haWwtIChzaGFuZW1p
c3NsZXIwQGdtYWlsLmNvbSkKCgoKLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uCgoKTGEgaW5mb3JtYWNpb24gY29udGVuaWRhIGVuIGVzdGUgY29ycmVvLCBhc2kgY29t
byBsYSBjb250ZW5pZGEgZW4gbG9zIGRvY3VtZW50b3MgYW5leG9zLCBwdWVkZSBjb250ZW5lciBk
YXRvcyBwZXJzb25hbGVzLCBwb3IgbG8gcXVlIHN1IGRpZnVzaW9uIGVzIHJlc3BvbnNhYmlsaWRh
ZCBkZSBxdWllbiBsb3MgdHJhbnNtaXRlIHkgcXVpZW4gbG9zIHJlY2liZSwgZW4gdMOpcm1pbm9z
IGRlIGxvIGRpc3B1ZXN0byBwb3IgbGFzIGZyYWNjaW9uZXMgSUkgeSBWSUkgZGVsIGFydGljdWxv
IDQsIHVsdGltbyBwYXJyYWZvIGRlbCBhcnRpY3VsbyA4LCBhcnRpY3VsbyAzNiBwYXJyYWZvIElJ
LCAzOCBmcmFjY2lvbiBJIHkgZGVtYXMgYXBsaWNhYmxlcyBkZSBsYSBMZXkgZGUgVHJhbnNwYXJl
bmNpYSB5IEFjY2VzbyBhIGxhIEluZm9ybWFjaW9uIFB1YmxpY2EgZGVsIERpc3RyaXRvIEZlZGVy
YWwuDQpMb3MgRGF0b3MgUGVyc29uYWxlcyBzZSBlbmN1ZW50cmFuIHByb3RlZ2lkb3MgcG9yIGxh
IExleSBkZSBQcm90ZWNjaW9uIGRlIERhdG9zIFBlcnNvbmFsZXMgZGVsIERpc3RyaXRvIEZlZGVy
YWwsIHBvciBsbyBxdWUgc3UgZGlmdXNpb24gc2UgZW5jdWVudHJhIHR1dGVsYWRhIGVuIHN1cyBh
cnRpY3Vsb3MgMiwgNSwgMTYsIDIxLCA0MSB5IGRlbWFzIHJlbGF0aXZvcyB5IGFwbGljYWJsZXMs
IGRlYmllbmRvIHN1amV0YXJzZSBlbiBzdSBjYXNvLCBhIGxhcyBkaXNwb3NpY2lvbmVzIHJlbGF0
aXZhcyBhIGxhIGNyZWFjaW9uLCBtb2RpZmljYWNpb24gbyBzdXByZXNpb24gZGUgZGF0b3MgcGVy
c29uYWxlcyBwcmV2aXN0b3MuIEFzaW1pc21vLCBkZWJlcmEgZXN0YXJzZSBhIGxvIHNlw7FhbGFk
byBlbiBsb3MgbnVtZXJhbGVzIDEgLCAzLCAxMiwgMTgsIDE5LCAyMCwgMjEsIDIzLCAyNCwgMjks
IDM1IHkgZGVtYXMgYXBsaWNhYmxlcyBkZSBsb3MgTGluZWFtaWVudG9zIHBhcmEgbGEgUHJvdGVj
Y2lvbiBkZSBEYXRvcyBQZXJzb25hbGVzIGVuIGVsIERpc3RyaXRvIEZlZGVyYWwuDQpFbiBlbCB1
c28gZGUgbGFzIHRlY25vbG9naWFzIGRlIGxhIGluZm9ybWFjaW9uIHkgY29tdW5pY2FjaW9uZXMg
ZGVsIEdvYmllcm5vIGRlbCBEaXN0cml0byBGZWRlcmFsLCBkZWJlcmEgb2JzZXJ2YXJzZSBwdW50
dWFsbWVudGUgbG8gZGlzcHVlc3RvIHBvciBsYSBMZXkgR29iaWVybm8gRWxlY3Ryb25pY28gZGVs
IERpc3RyaXRvIEZlZGVyYWwsIGxhIGxleSBwYXJhIGhhY2VyIGRlIGxhIENpdWRhZCBkZSBNZXhp
Y28gdW5hIENpdWRhZCBNYXMgQWJpZXJ0YSwgZWwgYXBhcnRhZG8gMTAgZGUgbGEgQ2lyY3VsYXIg
VW5vIHZpZ2VudGUgeSBsYXMgTm9ybWFzIEdlbmVyYWxlcyBxdWUgZGViZXJhbiBvYnNlcnZhcnNl
IGVuIG1hdGVyaWEgZGUgU2VndXJpZGFkIGRlIGxhIEluZm9ybWFjaW9uIGVuIGxhIEFkbWluaXN0
cmFjaW9uIFB1YmxpY2EgZGVsIERpc3RyaXRvIEZlZGVyYWwuCg==
