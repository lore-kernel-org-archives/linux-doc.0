Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E795C74A5B
	for <linux-doc@archiver.kernel.org>; Thu, 23 Mar 2023 18:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjCWSBL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Mar 2023 14:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjCWSBK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Mar 2023 14:01:10 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA0412CDB
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 11:01:03 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9672360A;
        Thu, 23 Mar 2023 18:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9672360A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1679594463; bh=e/uXryPOKxe+vVjSWcJ+FkUrhLcwmJJjAVBqY02z7s4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=m7EfrMtBB9LUSDJIDKdtxs46E6NmlY0J9a/oX3FSr4ZKNuPkryfvUZjkSy9wkADl8
         uv8all9jCNbFU2uEFvT3E3V04sfFAB0aDmaglQSTzhDgiwkYo4LOZelmc6Vi1rNORd
         T6fmrCx/0itFLQxSvQTUye99NwN9Tzao8dLCxLj7anx4CE7gny/BVIYFUrluG92SVH
         z2FCNTDEkfrl4Z0U6+HHc4ZECYr8RWgVgtsIXb9/wfTImaeAjSJ95boqg8H19WO5uA
         EQCMGv3lMjzAqXEFjaSEwe7oKGvj2+tx9artHlAbrR+IWrDEcREVsldgkwr942VcOS
         Cs9Y7tg36rXRQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Zang Leigang <zangleigang@hisilicon.com>, alexs@kernel.org,
        siyanteng@loongson.cn
Cc:     rppt@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: fix a wrong format
In-Reply-To: <20230316024519.27992-1-zangleigang@hisilicon.com>
References: <20230316024519.27992-1-zangleigang@hisilicon.com>
Date:   Thu, 23 Mar 2023 12:01:02 -0600
Message-ID: <87y1nnbb4x.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

WmFuZyBMZWlnYW5nIDx6YW5nbGVpZ2FuZ0BoaXNpbGljb24uY29tPiB3cml0ZXM6DQoNCj4gQWRk
IGEgbWlzc2luZyBtYXJrdXAgZm9yIHRoZSBjb2RlIHNuaXBwZXQgYXQgdGhlIGVuZCBvZiBscnVf
c29ydC5yc3QNCj4NCj4gU2lnbmVkLW9mZi1ieTogWmFuZyBMZWlnYW5nIDx6YW5nbGVpZ2FuZ0Bo
aXNpbGljb24uY29tPg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4tZ3Vp
ZGUvbW0vZGFtb24vbHJ1X3NvcnQucnN0ICAgICAgICB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4tZ3VpZGUvbW0vZGFtb24vbHJ1X3NvcnQu
cnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4tZ3VpZGUvbW0vZGFt
b24vbHJ1X3NvcnQucnN0DQo+IGluZGV4IDgxMmVmMzE1YzhmNi4uMDNkMzNjNzEwNjA0IDEwMDY0
NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9t
bS9kYW1vbi9scnVfc29ydC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vYWRtaW4tZ3VpZGUvbW0vZGFtb24vbHJ1X3NvcnQucnN0DQo+IEBAIC0yNTAsNyArMjUw
LDcgQEAgTFJV55qE5LyY5YWI57qn55qE5o+Q5Y2H77yM5ZCM5pe26ZmN5L2O6YKj5Lqb6LaF6L+H
MTIw56eS5peg5Lq66K6/6Zeu55qE5YaF5a2YDQo+ICDnkIbooqvpmZDliLblnKjmnIDlpJoxJeea
hENQVeS7pemBv+WFjURBTU9OX0xSVV9TT1JU5raI6LS56L+H5aSaQ1BV5pe26Ze044CC5Zyo57O7
57uf56m66Zey5YaF5a2Y6LaF6L+HNTAlDQo+ICDml7ZEQU1PTl9MUlVfU09SVOWBnOatouW3peS9
nO+8jOW5tuWcqOS9juS6jjQwJeaXtumHjeaWsOW8gOWni+W3peS9nOOAguWmguaenERBTU9OX1JF
Q0xBSU3msqHmnInlj5blvpcNCj4gIOi/m+WxleS4lOepuumXsuWGheWtmOS9juS6jjIwJe+8jOWG
jeasoeiuqURBTU9OX0xSVV9TT1JU5YGc5q2i5bel5L2c77yM5Lul5q2k5Zue6YCA5Yiw5LulTFJV
6ZO+6KGo5Li65Z+656GADQo+IC3ku6XpobXpnaLkuLrljZXkvY3nmoTlhoXlrZjlm57mlLbkuIrj
gIINCj4gK+S7pemhtemdouS4uuWNleS9jeeahOWGheWtmOWbnuaUtuS4iuOAgiA6Og0KDQpBcHBs
aWVkLCB0aGFua3MuDQoNCmpvbg0K
