Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C468BC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 17 Jan 2022 05:10:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiAQFKv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Jan 2022 00:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbiAQFKu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jan 2022 00:10:50 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A13C061574
        for <linux-doc@vger.kernel.org>; Sun, 16 Jan 2022 21:10:50 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id a2so7948523ilr.0
        for <linux-doc@vger.kernel.org>; Sun, 16 Jan 2022 21:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X8L+TziUknnfqLuiQdBgxZm5RgnSKsXADUKXS0PNDKs=;
        b=kH/DIQ8EoFyXfLBwtDiJD3/EmoP11UlVSwmqFaRyfVVdXVphgd7wQiZb9VuKiO/37c
         0tWqQXNo1LWFDz3ETtl+2Pzuy/DgDhHyLKINdVbXJP4J9KqvmflosSrZkOvu2QFfhcc8
         SRp0qHi7TaqpAMKn66e9N0f92ECBy6hZbVK1dnwY31SM5l+dIOzxk1npfREP/rSo/I7v
         Qoey4H0SOWqNqBHZb3F0W+p5w2R3WrVK0+tp6RmMuUXDkgv9aDoVg9nhA8b1YFfx9fJP
         Mkw5LnZLQeSkk6wy/Q/5utvfdaa0hg8yeRWOG226LKfc+SJpeZSrr92AY1I1Mlr/SI/U
         +odA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X8L+TziUknnfqLuiQdBgxZm5RgnSKsXADUKXS0PNDKs=;
        b=M8MquRN02Z6LbEJYwqRfXn3kbUTbn9yL9Htb6J52HxOlSx4AuNVsSmYqoFZkO84bXb
         zB9XdsqP5SpRzmJHi4JRJIlMgFfM3mWrBl6jnsuKK5N1cqwvcO7OWaEJ4/jFueePUgi6
         tI7/Lgv7kzSTUYG7tkFyrrVb+lqIuXG9AZP2DBr/x1SoqzP6v/0T58JwdO4m34fZg+zU
         xm4qvXiLoSxBBDd9MNc7y4I6h0T9RnzzVp8I+e217hR15yCwMlBMEeUMFjymECd1/Uy4
         4+G90raUVXajfEAPoJeLf1fqZ0tq4wEmh+hjTVVdkNqKresefTqH3hZNB2nMi7EpvpXD
         519Q==
X-Gm-Message-State: AOAM531hkmc78PMGdxLpBxAVn6nc3rcohtu1yCgUEURYWxAaUOGc8mN/
        ZO/udpd++ogCSRqrIRCrvKwfnSW4hZf0wkK3PHYysNY1ytGA/w==
X-Google-Smtp-Source: ABdhPJxI/yYAiLyQdqMwMOyexlywLRTyCO7mdlLUhoW4dK9udhBNoWhTNpNBYdowT4IAQa9hGubzd2tmvFZt8o1lsYk=
X-Received: by 2002:a05:6e02:1a49:: with SMTP id u9mr947218ilv.178.1642396249722;
 Sun, 16 Jan 2022 21:10:49 -0800 (PST)
MIME-Version: 1.0
References: <20220117043455.861550-1-xu.xin16@zte.com.cn> <20220117043854.861773-1-xu.xin16@zte.com.cn>
In-Reply-To: <20220117043854.861773-1-xu.xin16@zte.com.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 17 Jan 2022 13:10:13 +0800
Message-ID: <CAJy-Am=YDve54zSThcRda4zqajQ-dDWzGOdFi9EkyOBtf4DAVw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] zh_CN: Add translation for admin-guide/mm/index.rst
To:     CGEL <cgel.zte@gmail.com>
Cc:     YanTeng Si <sterlingteng@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        yanteng si <siyanteng01@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        xu.xin16@zte.com.cn, Yang Yang <yang.yang29@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gTW9uLCBKYW4gMTcsIDIwMjIgYXQgMTI6MzggUE0gPGNnZWwuenRlQGdtYWlsLmNvbT4gd3Jv
dGU6DQo+DQo+IEZyb206IHh1IHhpbiA8eHUueGluMTZAenRlLmNvbS5jbj4NCj4NCj4gVHJhbnNs
YXRlIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbW0vaW5kZXgucnN0IGludG8gQ2hpbmVzZS4N
Cj4gVXBkYXRlIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvaW5kZXgucnN0Lg0KPg0KPiBSZXZp
ZXdlZC1ieTogWWFuZyBZYW5nIDx5YW5nLnlhbmcyOUB6dGUuY29tLmNuPg0KPiBTaWduZWQtb2Zm
LWJ5OiB4dSB4aW4gPHh1LnhpbjE2QHp0ZS5jb20uY24+DQoNClJldmlld2VkLWJ5OiBBbGV4IFNo
aSA8YWxleHNAa2VybmVsLm9yZz4NCg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04v
YWRtaW4tZ3VpZGUvaW5kZXgucnN0ICAgICAgIHwgIDIgKy0NCj4gIC4uLi90cmFuc2xhdGlvbnMv
emhfQ04vYWRtaW4tZ3VpZGUvbW0vaW5kZXgucnN0ICAgIHwgNDkgKysrKysrKysrKysrKysrKysr
KysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
YWRtaW4tZ3VpZGUvbW0vaW5kZXgucnN0DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9pbmRleC5yc3QNCj4gaW5kZXggNTQ4ZTU3
Zi4uNzYzMDU1ZiAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vYWRtaW4tZ3VpZGUvaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL2FkbWluLWd1aWRlL2luZGV4LnJzdA0KPiBAQCAtNjksNiArNjksNyBAQCBUb2Rv
bGlzdDoNCj4gICAgIGxvY2t1cC13YXRjaGRvZ3MNCj4gICAgIHVuaWNvZGUNCj4gICAgIHN5c3Jx
DQo+ICsgICBtbS9pbmRleA0KPg0KPiAgVG9kb2xpc3Q6DQo+DQo+IEBAIC0xMDUsNyArMTA2LDYg
QEAgVG9kb2xpc3Q6DQo+ICAgICBMU00vaW5kZXgNCj4gICAgIG1kDQo+ICAgICBtZWRpYS9pbmRl
eA0KPiAtICAgbW0vaW5kZXgNCj4gICAgIG1vZHVsZS1zaWduaW5nDQo+ICAgICBtb25vDQo+ICAg
ICBuYW1lc3BhY2VzL2luZGV4DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9tbS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9tbS9pbmRleC5yc3QNCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uYjJjMTE0MA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBi
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL21tL2luZGV4LnJz
dA0KPiBAQCAtMCwwICsxLDQ5IEBADQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9D
Ti5yc3QNCj4gKw0KPiArOk9yaWdpbmFsOiAgIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbW0v
aW5kZXgucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4gKyAg5b6Q6ZGrIHh1IHhpbiA8eHUu
eGluMTZAenRlLmNvbS5jbj4NCj4gKw0KPiArDQo+ICs9PT09PT09PQ0KPiAr5YaF5a2Y566h55CG
DQo+ICs9PT09PT09PQ0KPiArDQo+ICtMaW51eOWGheWtmOeuoeeQhuWtkOezu+e7n++8jOmhvuWQ
jeaAneS5ie+8jOaYr+i0n+i0o+ezu+e7n+S4reeahOWGheWtmOeuoeeQhuOAguWug+WMheaLrOS6
huiZmuaLn+WGheWtmOS4juivt+axgg0KPiAr5YiG6aG155qE5a6e546w77yM5YaF5qC45YaF6YOo
57uT5p6E5ZKM55So5oi356m66Ze056iL5bqP55qE5YaF5a2Y5YiG6YWN44CB5bCG5paH5Lu25pig
5bCE5Yiw6L+b56iL5Zyw5Z2A56m66Ze05LulDQo+ICvlj4rorrjlpJrlhbbku5blvojphbfnmoTk
uovmg4XjgIINCj4gKw0KPiArTGludXjlhoXlrZjnrqHnkIbmmK/kuIDkuKrlhbfmnInorrjlpJrl
j6/phY3nva7orr7nva7nmoTlpI3mnYLns7vnu58sIOS4lOi/meS6m+iuvue9ruS4reeahOWkp+Wk
muaVsOmDveWPr+S7pemAmg0KPiAr6L+HIGBgL3Byb2NgYCDmlofku7bns7vnu5/ojrflvpfvvIzl
ubbkuJTlj6/ku6Xkvb/nlKggYGBzeXNjdGxgYCDov5vooYzmn6Xor6LlkozosIPmlbTjgILov5nk
uptBUEnmjqUNCj4gK+WPo+iiq+aPj+i/sOWcqERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lz
Y3RsL3ZtLnJzdOaWh+S7tuWSjCBgbWFuIDUgcHJvY2BfIOS4reOAgg0KPiArDQo+ICsuLiBfbWFu
IDUgcHJvYzogaHR0cDovL21hbjcub3JnL2xpbnV4L21hbi1wYWdlcy9tYW41L3Byb2MuNS5odG1s
DQo+ICsNCj4gK0xpbnV45YaF5a2Y566h55CG5pyJ5a6D6Ieq5bex55qE5pyv6K+t77yM5aaC5p6c
5L2g6L+Y5LiN54af5oKJ5a6D77yM6K+36ICD6JmR6ZiF6K+75LiL6Z2i5Y+C6ICD77yaDQo+ICs6
cmVmOmBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21tL2NvbmNlcHRzLnJzdCA8bW1fY29uY2Vw
dHM+YC4NCj4gKw0KPiAr5Zyo5q2k55uu5b2V5LiL77yM5oiR5Lus6K+m57uG5o+P6L+w5LqG5aaC
5L2V5LiOTGludXjlhoXlrZjnrqHnkIbkuK3nmoTlkITnp43mnLrliLbkuqTkupLjgIINCj4gKw0K
PiArLi4gdG9jdHJlZTo6DQo+ICsgICA6bWF4ZGVwdGg6IDENCj4gKw0KPiArICAga3NtDQo+ICsN
Cj4gK1RvZG9saXN0Og0KPiArKiBjb25jZXB0cw0KPiArKiBjbWFfZGVidWdmcw0KPiArKiBkYW1v
bi9pbmRleA0KPiArKiBodWdldGxicGFnZQ0KPiArKiBpZGxlX3BhZ2VfdHJhY2tpbmcNCj4gKyog
bWVtb3J5LWhvdHBsdWcNCj4gKyogbm9tbXUtbW1hcA0KPiArKiBudW1hX21lbW9yeV9wb2xpY3kN
Cj4gKyogbnVtYXBlcmYNCj4gKyogcGFnZW1hcA0KPiArKiBzb2Z0LWRpcnR5DQo+ICsqIHN3YXBf
bnVtYQ0KPiArKiB0cmFuc2h1Z2UNCj4gKyogdXNlcmZhdWx0ZmQNCj4gKyogenN3YXANCj4gLS0N
Cj4gMi4xNS4yDQo+DQo=
