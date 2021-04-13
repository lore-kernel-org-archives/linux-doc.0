Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922E0C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 21:57:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6ACE36128E
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 21:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbhDMV5d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 17:57:33 -0400
Received: from ms.lwn.net ([45.79.88.28]:48202 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232361AbhDMV5d (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 17:57:33 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 35011733;
        Tue, 13 Apr 2021 21:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 35011733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618351033; bh=i1XTcelo826jCKy9OyopPyCzE0AHmVsm2efEbvE45u4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=dsdDz5qBMuUj+twePTcTcogWIvO3vPmyLhh9UmXr3jKE7/WxkkJwgmjgNtkkXQQPl
         P/DVJSBgSc5ob065US8xB6qS/iuBET4R50/GRQCY9AlTan85k5Zsnz38pRC2yZWlK5
         eOhdnh2pWtrTuz2djqMuLK+6d5tHZkk8kKQFVZXwI5UeKNtr9y5cVn9L5UJmzQGqsO
         O0j4fdhkjAAA99YiL8umjjIif2WZVcTQcMVKAX5IXlZPwMoKpA/9w8MR+GgcnhBZQX
         wrPeCV6FV6PjtLWiTEm1eZIoECEhpltUNKk+m4IPzR6Er5rS+bjm3rThOIATlMYdOd
         aygOmORU+XpGA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>, YanTeng Si <sterlingteng@gmail.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/7] docs/zh_CN: Add translation
 zh_CN/doc-guide/kernel-doc.rst
In-Reply-To: <783d134b1dd18f580f2c0511c2330382a86e79b5.1618295149.git.bobwxc@email.cn>
References: <cover.1618295149.git.bobwxc@email.cn>
 <783d134b1dd18f580f2c0511c2330382a86e79b5.1618295149.git.bobwxc@email.cn>
Date:   Tue, 13 Apr 2021 15:57:12 -0600
Message-ID: <87lf9lrgp3.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPiB3cml0ZXM6DQoNCj4gQWRkIG5ldyB0cmFu
c2xhdGlvbg0KPiAgIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RvYy1ndWlkZS9r
ZXJuZWwtZG9jLnJzdA0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBXdSBYaWFuZ0NoZW5nIDxib2J3eGNA
ZW1haWwuY24+DQo+IFJldmlld2VkLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24u
Y24+DQo+IC0tLQ0KPiAgLi4uL3poX0NOL2RvYy1ndWlkZS9rZXJuZWwtZG9jLnJzdCAgICAgICAg
ICAgIHwgNTAwICsrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDUwMCBpbnNl
cnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vZG9jLWd1aWRlL2tlcm5lbC1kb2MucnN0DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kb2MtZ3VpZGUva2VybmVsLWRvYy5yc3QgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kb2MtZ3VpZGUva2VybmVsLWRvYy5yc3QN
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iMDQyNzk0NGY4
ZjANCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9kb2MtZ3VpZGUva2VybmVsLWRvYy5yc3QNCj4gQEAgLTAsMCArMSw1MDAgQEANCj4gKy4u
IGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERv
Y3VtZW50YXRpb24vZG9jLWd1aWRlL2tlcm5lbC1kb2MucnN0DQo+ICsNCj4gKzror5HogIU6IOWQ
tOaDs+aIkCBXdSBYaWFuZ0NoZW5nIDxib2J3eGNAZW1haWwuY24+DQo+ICsNCj4gK+e8luWGmWtl
cm5lbC1kb2Pms6jph4oNCj4gKz09PT09PT09PT09PT09PT09PQ0KPiArDQo+ICtMaW51eOWGheag
uOa6kOaWh+S7tuWPr+S7peWMheWQq2tlcm5lbC1kb2PmoLzlvI/nmoTnu5PmnoTljJbmlofmoaPm
s6jph4rvvIznlKjku6Xmj4/ov7Dku6PnoIHnmoTlh73mlbDjgIENCj4gK+exu+Wei+WSjOiuvuiu
oeOAguWwhuaWh+aho+W1jOWFpea6kOaWh+S7tuabtOWuueaYk+S/neaMgeaWh+aho+acgOaWsOOA
gg0KPiArDQo+ICsuLiBub3RlOjog5YaF5qC45paH5qGj5qC85byP5LiOamF2YWRvY+OAgWd0ay1k
b2PmiJZEb3h5Z2Vu55yL5Ly85b6I55u45Ly877yM5L2G55Sx5LqO5Y6G5Y+y5Y6f5Zug77yMDQo+
ICsgICAgICAgICAg5a6e6ZmF5pyJ552A5piO5pi+55qE5LiN5ZCM44CC5YaF5qC45rqQ5YyF5ZCr
5oiQ5Y2D5LiK5LiH5Liqa2VybmVsLWRvY+azqOmHiuOAguivt+WdmuaMgemBteW+qg0KPiArICAg
ICAgICAgIOatpOWkhOaPj+i/sOeahOmjjuagvOOAgg0KPiArDQo+ICsuLiBub3RlOjoga2VybmVs
LWRvY+aXoOazleWMheWQq1J1c3Tku6PnoIHvvJror7flj4LogIMNCj4gKyAgICAgICAgICA6cmVm
OmBEb2N1bWVudGF0aW9uL3J1c3QvZG9jcy5yc3QgPHJ1c3RfZG9jcz5g44CCDQoNCk5vdGUgdGhh
dCB0aGlzIHJlZmVyZW5jZSBhZGRzIGEgd2FybmluZyB0byB0aGUgZG9jcy1uZXh0IGJ1aWxkIC0g
dGhpcw0KdHJhbnNsYXRpb24gaXMgZXZpZGVudGx5IGFnYWluc3QgbGludXgtbmV4dCBpbnN0ZWFk
LiAgVGhlIHdhcm5pbmcgd2lsbA0KZXZlbnR1YWxseSBnbyBhd2F5LCBidXQgaXQgd291bGQgYmUg
YmV0dGVyIG5vdCB0byBkbyB0aGlzIGlmIHBvc3NpYmxlLg0KDQpBbHNvLCB0aGVyZSBpcyBubyBu
ZWVkIGZvciBhIDpyZWY6IGhlcmU7IGp1c3Qgc2F5DQoiRG9jdW1lbnRhdGlvbi9ydXN0L2RvY3Mu
cnN0IiBhbmQgdGhlIGF1dG9tYXJrdXAgY29kZSB3aWxsIGRvIHRoZSByaWdodA0KdGhpbmcuICBZ
ZXMsIHRoYXQgc2hvdWxkIGJlIGNoYW5nZWQgaW4gdGhlIG9yaWdpbmFsIGFzIHdlbGwuDQoNClRo
YW5rcywNCg0Kam9uDQo=
