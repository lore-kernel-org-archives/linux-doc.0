Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C28C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 22 Mar 2022 07:50:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiCVHwP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Mar 2022 03:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiCVHwP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Mar 2022 03:52:15 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CF0BE0F
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:50:48 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id w7so19322099ioj.5
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=O+IFKHT5aaQYHQHWqyLdIFC7zYGyc+IiyeldMudHxoE=;
        b=RPx0zsL+jFrbNyiuqqfvUqo784DpU1f0gda/F2xJU1o7lss0diX2ZYkx8VN8KSr89y
         YWp/oCNqSTzAwy0McLGNq2IYFvZtnHsMg7K8eHHKo/rtqKRoDVvyTfln4f+0wKfKwAdB
         hF5Uf2B8UJ5bqesVA52ozZONJMAGzByphEbKygf4KSdlMjUU3fkr/SpedjuEbco6ghSJ
         PmCQfs/1tIraaEBkocMuCvkTJgoSAWt276eK64QLfApl7hf9N3f3hlQldzHAb9FB1Wq7
         Z9N8k8Nshuriqqa6FwdUcH/O7XX+8Y118ZAKlfo3l54Ytaeeke/2fdR4YjEG+McmMKRd
         eGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=O+IFKHT5aaQYHQHWqyLdIFC7zYGyc+IiyeldMudHxoE=;
        b=a+RQOyA5EGzeTE/rooJ1Umz5gLWKZPLsW7Haflq0c0eDa9U6/l/mhDos/9ay+0DLlE
         CwEcVlUEe5fdLfOXD55T30h3+SZIV+7f/TVpXEQ9WkW/yURjVLVXB3NDKhxYcSzW4L90
         +HZWK8psq/maSLZr/3fwklhxDMBzvEbtaRJsaFEAAIwCyUG4rybVJJPReHRMlm386Ub6
         8ZzT4UQJ+CUHbAPJll0XVaAq4q7uzdKPWISCAhNVQrQAihXIFi/iCt0s/Ubt38KcFLDh
         kKJg6yWlVprlE69yBXq802ou1RxfuUMURfl2uFba/UPVDqPxCtBB5DYaESVxD0IQWDfF
         EL+Q==
X-Gm-Message-State: AOAM533/gDjKlmk5UNY+9T1S1DILGvpyUU1J/kYZx0xJUmNVflBLT0JX
        DJHY/n4DYB59Ig+sQSlro7puoCSfBF8tIccZKXI=
X-Google-Smtp-Source: ABdhPJw/8hH+inqQrewhO+9h7/qJx4Ba67lKJPz/7I/XyrJ6n1khnnLdIE0rREsJ2K2Ak2kVd3koaeXcD3/lGG1xOgc=
X-Received: by 2002:a02:3501:0:b0:314:48d3:2d6b with SMTP id
 k1-20020a023501000000b0031448d32d6bmr11996204jaa.169.1647935447712; Tue, 22
 Mar 2022 00:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647498763.git.siyanteng@loongson.cn> <b0d6e2d76b1ac0a5c9239c7b3402dc7855095d7e.1647498763.git.siyanteng@loongson.cn>
In-Reply-To: <b0d6e2d76b1ac0a5c9239c7b3402dc7855095d7e.1647498763.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 22 Mar 2022 15:50:11 +0800
Message-ID: <CAJy-Am=c5wFBuDzWj8B98zbsYzi7bnEvyqTz96+foJZoDR0aMA@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] docs/zh_CN: add vm page_table_check translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBNYXIgMTcsIDIwMjIgYXQgMjo1MSBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBGcm9tOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBnbWFp
bC5jb20+DQo+DQo+IFRyYW5zbGF0ZSAuLi4vdm0vcGFnZV90YWJsZV9jaGVjay5yc3QgaW50byBD
aGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdz
b24uY24+DQoNClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCg0KPiAt
LS0NCj4gIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdCB8ICAy
ICstDQo+ICAuLi4vemhfQ04vdm0vcGFnZV90YWJsZV9jaGVjay5yc3QgICAgICAgICAgICAgfCA1
NiArKysrKysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi92bS9wYWdlX3RhYmxlX2NoZWNrLnJzdA0KPg0KPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0IGIvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0DQo+IGluZGV4IGFhOTgzZDAy
MzA0NS4uYTJkZWE4YjYxOGFkIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vdm0vaW5kZXgucnN0DQo+IEBAIC0zNCw2ICszNCw3IEBAIFRPRE865b6F5byV55So
5paH5qGj6ZuG6KKr57+76K+R5a6M5q+V5ZCO6K+35Y+K5pe25L+u5pS55q2k5aSE77yJDQo+ICAg
ICBvdmVyY29tbWl0LWFjY291bnRpbmcNCj4gICAgIHBhZ2VfZnJhZ3MNCj4gICAgIHBhZ2Vfb3du
ZXINCj4gKyAgIHBhZ2VfdGFibGVfY2hlY2sNCj4NCj4gIFRPRE9MSVNUOg0KPiAgKiBhcmNoX3Bn
dGFibGVfaGVscGVycw0KPiBAQCAtNDIsNyArNDMsNiBAQCBUT0RPTElTVDoNCj4gICogaHVnZXRs
YmZzX3Jlc2Vydg0KPiAgKiBudW1hDQo+ICAqIHBhZ2VfbWlncmF0aW9uDQo+IC0qIHBhZ2VfdGFi
bGVfY2hlY2sNCj4gICogcmVtYXBfZmlsZV9wYWdlcw0KPiAgKiBzbHViDQo+ICAqIHNwbGl0X3Bh
Z2VfdGFibGVfbG9jaw0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vdm0vcGFnZV90YWJsZV9jaGVjay5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi92bS9wYWdlX3RhYmxlX2NoZWNrLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiBpbmRleCAwMDAwMDAwMDAwMDAuLmEyOWZjMWIzNjBlNg0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL3BhZ2VfdGFibGVfY2hlY2su
cnN0DQo+IEBAIC0wLDAgKzEsNTYgQEANCj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wDQo+ICsNCj4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi92bS9wYWdlX3RhYmxlX2No
ZWNrLnJzdA0KPiArDQo+ICs657+76K+ROg0KPiArDQo+ICsg5Y+45bu26IW+IFlhbnRlbmcgU2kg
PHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gKw0KPiArOuagoeivkToNCj4gKw0KPiArDQo+ICs9
PT09PT09PQ0KPiAr6aG16KGo5qOA5p+lDQo+ICs9PT09PT09PQ0KPiArDQo+ICvmpoLov7ANCj4g
Kz09PT0NCj4gKw0KPiAr6aG16KGo5qOA5p+l5YWB6K646YCa6L+H56Gu5L+d6Ziy5q2i5p+Q5Lqb
57G75Z6L55qE5YaF5a2Y5o2f5Z2P5p2l5by65YyW5YaF5qC444CCDQo+ICsNCj4gK+W9k+aWsOea
hOmhtemdouWPr+S7peS7jueUqOaIt+epuumXtOiuv+mXruaXtu+8jOmhteihqOajgOafpemAmui/
h+WwhuWug+S7rOeahOmhteihqOmhue+8iFBURXMgUE1E562J77yJ5re75Yqg5Yiw6aG16KGo5Lit
5p2l5omn6KGM6aKd5aSWDQo+ICvnmoTpqozor4HjgIINCj4gKw0KPiAr5Zyo5qOA5rWL5Yiw5o2f
5Z2P55qE5oOF5Ya15LiL77yM5YaF5qC45Lya6KKr5bSp5rqD44CC6aG16KGo5qOA5p+l5pyJ5LiA
5Liq5bCP55qE5oCn6IO95ZKM5YaF5a2Y5byA6ZSA44CC5Zug5q2k77yM5a6D5Zyo6buY6K6k5oOF
5Ya15LiL5piv56aB55SoDQo+ICvnmoTvvIzkvYbmmK/lnKjpop3lpJbnmoTliqDlm7rotoXov4fm
gKfog73miJDmnKznmoTns7vnu5/kuIrvvIzlj6/ku6XpgInmi6nlkK/nlKjjgILlj6blpJbvvIzn
lLHkuo7pobXooajmo4Dmn6XmmK/lkIzmraXnmoTvvIzlroPlj6/ku6XluK7liqnosIMNCj4gK+iv
leWPjOaYoOWwhOWGheWtmOaNn+Wdj+mXrumimO+8jOWcqOmUmeivr+eahOaYoOWwhOWPkeeUn+aX
tuW0qea6g+WGheaguO+8jOiAjOS4jeaYr+WcqOWGheWtmOaNn+Wdj+mUmeivr+WPkeeUn+WQjuWG
heaguOW0qea6g+OAgg0KPiArDQo+ICvlj4zph43mmKDlsITmo4DmtYvpgLvovpENCj4gKz09PT09
PT09PT09PT09PT0NCj4gKw0KPiArKy0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gK3wgQ3VycmVu
dCBNYXBwaW5nICAgfCBOZXcgbWFwcGluZyAgICAgICB8IFBlcm1pc3Npb25zICAgICAgIHwgUnVs
ZSAgICAgICAgICAgICB8DQo+ICsrPT09PT09PT09PT09PT09PT09PSs9PT09PT09PT09PT09PT09
PT09Kz09PT09PT09PT09PT09PT09PT0rPT09PT09PT09PT09PT09PT09Kw0KPiArfCBBbm9ueW1v
dXMgICAgICAgICB8IEFub255bW91cyAgICAgICAgIHwgUmVhZCAgICAgICAgICAgICAgfCBBbGxv
dyAgICAgICAgICAgIHwNCj4gKystLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICt8IEFub255bW91
cyAgICAgICAgIHwgQW5vbnltb3VzICAgICAgICAgfCBSZWFkIC8gV3JpdGUgICAgICB8IFByb2hp
Yml0ICAgICAgICAgfA0KPiArKy0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0t
LSstLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gK3wgQW5vbnltb3Vz
ICAgICAgICAgfCBOYW1lZCAgICAgICAgICAgICB8IEFueSAgICAgICAgICAgICAgIHwgUHJvaGli
aXQgICAgICAgICB8DQo+ICsrLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0t
Ky0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiArfCBOYW1lZCAgICAg
ICAgICAgICB8IEFub255bW91cyAgICAgICAgIHwgQW55ICAgICAgICAgICAgICAgfCBQcm9oaWJp
dCAgICAgICAgIHwNCj4gKystLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0r
LS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICt8IE5hbWVkICAgICAg
ICAgICAgIHwgTmFtZWQgICAgICAgICAgICAgfCBBbnkgICAgICAgICAgICAgICB8IEFsbG93ICAg
ICAgICAgICAgfA0KPiArKy0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLSst
LS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gKw0KPiAr5ZCv55So6aG1
6KGo5qOA5p+lDQo+ICs9PT09PT09PT09PT0NCj4gKw0KPiAr55So5Lul5LiL5pa55rOV5p6E5bu6
5YaF5qC4Og0KPiArDQo+ICstIFBBR0VfVEFCTEVfQ0hFQ0s9eQ0KPiArICDms6jmhI/vvIzlroPl
j6rog73lnKhBUkNIX1NVUFBPUlRTX1BBR0VfVEFCTEVfQ0hFQ0vlj6/nlKjnmoTlubPlj7DkuIrl
kK/nlKjjgIINCj4gKw0KPiArLSDkvb/nlKggInBhZ2VfdGFibGVfY2hlY2s9b24iIOWGheaguOWP
guaVsOWQr+WKqOOAgg0KPiArDQo+ICvlj6/ku6XpgInmi6nnlKhQQUdFX1RBQkxFX0NIRUNLX0VO
Rk9SQ0VE5p2l5p6E5bu65YaF5qC477yM5Lul5L6/5Zyo5rKh5pyJ6aKd5aSW55qE5YaF5qC45Y+C
5pWw55qE5oOF5Ya15LiL6I635b6X6aG16KGoDQo+ICvmlK/mjIHjgIINCj4gLS0NCj4gMi4yNy4w
DQo+DQo=
