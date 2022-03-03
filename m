Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B46BC433EF
	for <linux-doc@archiver.kernel.org>; Thu,  3 Mar 2022 09:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbiCCJzm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Mar 2022 04:55:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231740AbiCCJzl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Mar 2022 04:55:41 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B8B15DB23
        for <linux-doc@vger.kernel.org>; Thu,  3 Mar 2022 01:54:55 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id w4so3591956ilj.5
        for <linux-doc@vger.kernel.org>; Thu, 03 Mar 2022 01:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dry1et1ezCosrUvGsFPj2D/fRggcShEU+N7yi1GKims=;
        b=EX5FjtVN1IF3aGbVfFmcEt9xapdy8tEkoMt7kTQcNTB4BWVwxgad88vmYvLzq04G9q
         mSZmEzPWH/+ZJ2iHfxlp2lf9hSTJDhrWguG5ArLmz0XiQZp52mOlZWAVFfWNarfv+L12
         3NrLs3UPpKlPZWemhWK1vdRCz80RZIzD2+i2Q3XDJ7JibmpuTcatUqlPcz+xb1QBhLyR
         WEKI0Jyd/YNlxQ4jPi9h5f6U8u93ULr8oNBaEWyMltJ0AUltfNIxRy/bmVWZTqwpokxp
         FwQ5XQrDjzREQKMCtIMwkIcNNPy/tCBBcpF++aSm/Re6vzH8MUpbgm4JGSFdVVTgG1Om
         2JuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dry1et1ezCosrUvGsFPj2D/fRggcShEU+N7yi1GKims=;
        b=HZ+524u87Y8GUYu5jNJ3evljQ4yHnebBYDkoU1al79zE9kZFIDMfvMCwfVWw2iM09g
         jiyhmOUTuYE4y7e3gTLZJTScVIe6yIP5qpYjyPSvXL/NO1vj70Y81EtPbzLMvZ4F8VKB
         PKKBp9+hbD1/O0La93YIZCdFuSejpPyPz8bk3tf2QEqOrqEwDwayMmdOnwBiaW4CG3l/
         2EnpLSp0FLoKp3IFgq2Z8+2wkfScpdIj3voG3TF9dbpFvymERT4C999xZUOW15BCViVs
         XW/VAw5rl219Tz4o5OQZ5U2sgHB4V3L0p64Y4rTmVVXhdDBxlUZ6tdSHlRdb/pqnL9SX
         9fBw==
X-Gm-Message-State: AOAM533zRsjlqDuAyde5WaO18nJqjwVLwXXZP5fZeWUaoU8geDWCU2D+
        cHUa2Un6xVkelUAa2XpGzL6dgQk6FsEV5Gijg+A=
X-Google-Smtp-Source: ABdhPJwU4a5jWRltxTm03k+lTtWAODh6QFRnYI4NdaCHShYHjU6S29vdUshkeIW8QSvnrO7iebdbWNkSDmOndL2NfDw=
X-Received: by 2002:a05:6e02:1746:b0:2c2:8a1f:8ca6 with SMTP id
 y6-20020a056e02174600b002c28a1f8ca6mr30214064ill.178.1646301294974; Thu, 03
 Mar 2022 01:54:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646294349.git.siyanteng@loongson.cn> <ed0830eaad6b9832204e753bb571d21e87f52130.1646294349.git.siyanteng@loongson.cn>
In-Reply-To: <ed0830eaad6b9832204e753bb571d21e87f52130.1646294349.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 3 Mar 2022 17:54:19 +0800
Message-ID: <CAJy-AmmQxxADyui0fRJt_L9ZHYEi_KgJUk-8ODyd25r+OU17xQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs/zh_CN: add devicetree index translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBNYXIgMywgMjAyMiBhdCA0OjA5IFBNIFlhbnRlbmcgU2kgPHNpeWFudGVuZzAxQGdt
YWlsLmNvbT4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSAuLi4vZGV2aWNldHJlZS9pbmRleC5yc3Qg
aW50byBDaGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdA
bG9vbmdzb24uY24+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZzAxQGdt
YWlsLmNvbT4NCg0KVWgsIGl0J3MgZmlyc3QgdGltZSBmb3IgbWUgdG8gc2VlIDIgc2lnbmVkLW9m
ZiBmcm9tIHNhbWUgIHBlcnNvbi4gOikNCg0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0Br
ZXJuZWwub3JnPg0KDQo+IC0tLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXZpY2V0cmVl
L2luZGV4LnJzdCAgIHwgNDkgKysrKysrKysrKysrKysrKysrKw0KPiAgRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vaW5kZXgucnN0ICAgIHwgIDYgKystDQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDU0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXZpY2V0cmVlL2luZGV4LnJzdA0K
Pg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGV2aWNl
dHJlZS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXZpY2V0
cmVlL2luZGV4LnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjVjYTFhZTg3YjU3ZA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL2RldmljZXRyZWUvaW5kZXgucnN0DQo+IEBAIC0wLDAgKzEsNDkg
QEANCj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsuLiBpbmNsdWRl
OjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0
aW9uL0RldmljZXRyZWUvaW5kZXgucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4gKyDlj7jl
u7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICs65qCh6K+R
Og0KPiArDQo+ICsNCj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICtPcGVuIEZp
cm13YXJlIOWSjCBEZXZpY2V0cmVlDQo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
PiArDQo+ICvor6XmlofmoaPmmK/mlbTkuKrorr7lpIfmoJHmlofmoaPnmoTmgLvnm67lvZXvvIzm
oIfpopjkuK3lpJrmmK/kuJrlhoXpu5jorqTnmoTmnK/or63vvIzliJ3op4HlsLHnv7vor5HmiJDk
uK3mlofvvIwNCj4gK+aZpua2qemavuaHgu+8jOWboOatpOWwvemHj+S/neeVme+8jOWQjumdoue/
u+ivkeWFtuWtkOaWh+aho+aXtu+8jOWPr+iDveS8muagueaNruivreWig++8jOeBtea0u+WcsOe/
u+ivkeS4uuS4reaWh+OAgg0KPiArDQo+ICvlhoXmoLhEZXZpY2V0cmVl55qE5L2/55SoDQo+ICs9
PT09PT09PT09PT09PT09PT09PT09PQ0KPiArLi4gdG9jdHJlZTo6DQo+ICsgICA6bWF4ZGVwdGg6
IDENCj4gKw0KPiArVG9kb2xpc3Q6DQo+ICsNCj4gKyogICB1c2FnZS1tb2RlbA0KPiArKiAgIG9m
X3VuaXR0ZXN0DQo+ICsqICAga2VybmVsLWFwaQ0KPiArDQo+ICtEZXZpY2V0cmVlIE92ZXJsYXlz
DQo+ICs9PT09PT09PT09PT09PT09PT09DQo+ICsuLiB0b2N0cmVlOjoNCj4gKyAgIDptYXhkZXB0
aDogMQ0KPiArDQo+ICtUb2RvbGlzdDoNCj4gKw0KPiArKiAgIGNoYW5nZXNldHMNCj4gKyogICBk
eW5hbWljLXJlc29sdXRpb24tbm90ZXMNCj4gKyogICBvdmVybGF5LW5vdGVzDQo+ICsNCj4gK0Rl
dmljZXRyZWUgQmluZGluZ3MNCj4gKz09PT09PT09PT09PT09PT09PT0NCj4gKy4uIHRvY3RyZWU6
Og0KPiArICAgOm1heGRlcHRoOiAxDQo+ICsNCj4gK1RvZG9saXN0Og0KPiArDQo+ICsqICAgYmlu
ZGluZ3MvaW5kZXgNCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZGV4LnJz
dA0KPiBpbmRleCAyM2Y4ZjRjNjhlODMuLjQ2YTI5ZjAwNmJkNCAxMDA2NDQNCj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZGV4LnJzdA0KPiBAQCAtNTYsMTAgKzU2LDE0IEBA
IFRPRE9MaXN0Og0KPg0KPiAg5LiL5YiX5paH5qGj5o+P6L+w5LqG5YaF5qC46ZyA6KaB55qE5bmz
5Y+w5Zu65Lu255u45YWz5L+h5oGv44CCDQo+DQo+ICsuLiB0b2N0cmVlOjoNCj4gKyAgIDptYXhk
ZXB0aDogMg0KPiArDQo+ICsgICBkZXZpY2V0cmVlL2luZGV4DQo+ICsNCj4gIFRPRE9MaXN0Og0K
Pg0KPiAgKiBmaXJtd2FyZS1ndWlkZS9pbmRleA0KPiAtKiBkZXZpY2V0cmVlL2luZGV4DQo+DQo+
ICDlupTnlKjnqIvluo/lvIDlj5HkurrlkZjmlofmoaMNCj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+IC0tDQo+IDIuMjcuMA0KPg0K
