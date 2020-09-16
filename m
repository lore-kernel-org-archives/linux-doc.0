Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BFCC433E2
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 08:49:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE11F20872
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 08:49:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgIPItR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Sep 2020 04:49:17 -0400
Received: from m176151.mail.qiye.163.com ([59.111.176.151]:60445 "EHLO
        m176151.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgIPItP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Sep 2020 04:49:15 -0400
Received: from vivo.com (wm-11.qy.internal [127.0.0.1])
        by m176151.mail.qiye.163.com (Hmail) with ESMTP id 92D9148448C;
        Wed, 16 Sep 2020 16:49:09 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <ABoAqQDVDSunbaCnreBd5qp4.3.1600246149566.Hmail.bailu.lin@vivo.com>
To:     Will Deacon <will@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, wangqing@vivo.com
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gZG9jOiB6aF9DTjogaW5kZXggZmlsZXMgaW4gYXJtNjQgc3ViZGlyZWN0b3J5?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.226
In-Reply-To: <20200916084030.GE27496@willie-the-truck>
MIME-Version: 1.0
Received: from bailu.lin@vivo.com( [58.251.74.226) ] by ajax-webmail ( [127.0.0.1] ) ; Wed, 16 Sep 2020 16:49:09 +0800 (GMT+08:00)
From:   =?UTF-8?B?5p6X55m96bmt?= <bailu.lin@vivo.com>
Date:   Wed, 16 Sep 2020 16:49:09 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZSU8fSxoaGhpJHhodVkpNS0tJT01KT0JNSEtVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VKS0tZBg++
X-HM-Sender-Digest: e1kJHlYWEh9ZQU5DTU9NQktDSExDN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
        WUc6ORQ6Cio*LT8oDhUZGjgVCR45H04KC09VSFVKTUtLSU9NSk5KS01NVTMWGhIXVRkaEhcOVRcS
        FTsNEg0UVRgUFkVZV1kSC1lBWU5DVUlOSlVMT1VJSU1ZV1kIAVlBSElPSDcG
X-HM-Tid: 0a74961a71e893b5kuws92d9148448c
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

U29ycnksIHNob3VkIGJlIGFybTY0LiBJJ2xsIGZpeCBpdC4KClRoYW5rcwpCYWlsdQoKRnJvbTog
V2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4KRGF0ZTogMjAyMC0wOS0xNiAxNjo0MDozMQpU
bzogIEJhaWx1IExpbiA8YmFpbHUubGluQHZpdm8uY29tPgpDYzogIENhdGFsaW4gTWFyaW5hcyA8
Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+LEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+
LEhhcnJ5IFdlaSA8aGFycnl4aXlvdUBnbWFpbC5jb20+LEFsZXggU2hpIDxhbGV4LnNoaUBsaW51
eC5hbGliYWJhLmNvbT4sbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLGxpbnV4
LWRvY0B2Z2VyLmtlcm5lbC5vcmcsbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyx3YW5ncWlu
Z0B2aXZvLmNvbQpTdWJqZWN0OiBSZTogW1BBVENIXSBkb2M6IHpoX0NOOiBpbmRleCBmaWxlcyBp
biBhcm02NCBzdWJkaXJlY3Rvcnk+T24gVHVlLCBTZXAgMTUsIDIwMjAgYXQgMDk6NTc6MDFQTSAt
MDcwMCwgQmFpbHUgTGluIHdyb3RlOgo+PiBBZGQgZmlsZXN5c3RlbXMgc3ViZGlyZWN0b3J5IGlu
dG8gdGhlIHRhYmxlIG9mIENvbnRlbnRzIGZvciB6aF9DTiwKPj4gYWxsIHRyYW5zbGF0aW9ucyBy
ZXNpZGluZyBvbiBpdCB3b3VsZCBiZSBpbmRleGVkIGNvbnZlbmllbnRseS4KPgo+U29ycnksIEkg
ZG9uJ3QgdW5kZXJzdGFuZCB0aGUgcmVmZXJlbmNlIHRvICJmaWxlc3lzdGVtcyIgaGVyZS4gSXMg
dGhpcwo+YSBjb3B5LXBhc3RlIG9mIGEgZGlmZmVyZW50IGNvbW1pdCBtZXNzYWdlLCBvciBhbSBJ
IGp1c3QgZmFpbGluZyB0byByZWFkCj5pdCBwcm9wZXJseT8KPgo+V2lsbAoNCg0K
