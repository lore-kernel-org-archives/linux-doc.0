Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F3CC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 18 Mar 2022 10:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234752AbiCRKNT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Mar 2022 06:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234693AbiCRKNS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Mar 2022 06:13:18 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1612F2CC346
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 03:12:00 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id b9so5490428ila.8
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 03:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=46AyXOpPpaSISm9j2JZjBYNNV1Z2w86wZxK0pcYfUKY=;
        b=Rr4KXZ3GJSE//FXOLWUPef5xKLOpGt4eu4ZbHJihWlMloReuHo/LqcGLTUwyJ2fhep
         J82gdizL/5A3/BbDq7bSMFfnTv8/KPprK4UHd0T6L9meAj/Wbw7MceJClzIdaKR7yOD+
         +0/CeKPxcG684y9QbfGAIJFad4Ghq1rsrLTZ0R7JWsZ7JWreFBQIE239du5KgkAbVU9u
         EH5n36McdvmiR6eAINBv2sKhxjDHmLl4euZyUrdEvws9dFiIhlQck9Ck2DTWAHmHqvxp
         u0GpgzSdPyztVaKMlxl7yLH1pg0042fcHe4S7GeVAQ97hGzYDJ2F0fAnGivdrHMB+rY6
         W2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=46AyXOpPpaSISm9j2JZjBYNNV1Z2w86wZxK0pcYfUKY=;
        b=GzDhEF8uuaToly0Zsf1yYAm5U1Jll/KvCSl1BZuVJru5BkG2aSSvmv6WhQ++zAkxqG
         PaeECCVEZr2nhdWMScb5xnUD1BnayEGYDksxwc2nj09B7m8xlVGvCI+X7Rr72BNJcPdv
         lXK780m5zi3tcRIMeE/UI8eIi18Kw0t+Fhm3Osaw3xrfUrxdHRiPCbXH+vmLkr8UYfFI
         R/Be78jZpQOSPHqsrj5mVL9Gq8yLsB9zJcGG0skjvfpui4QBiJg1MIo16D/4pr59lrgZ
         hImOoeKbz9Hh9DYOsdTlzqjrTTBpJO1d9QlWEx/P+kkYhVFFORzi9pdfU/QQNHRfMUVY
         oCFA==
X-Gm-Message-State: AOAM5329NGB03eI2QLNHq7ovvQissuxxS0vy1WrdjBqfI7RAZBePoyGG
        NJps7mi/zB5eQolxsoEEc3ZUfFpZzABFZDH4xfty2Yaiaqs=
X-Google-Smtp-Source: ABdhPJzoI5HSfQtemznd5HA8esBxYOWc7qfAUspcyIN8YbHYMpi84+FdtZWArJYonbTN5u0iaGWjbK9/AxxYMKuetHE=
X-Received: by 2002:a05:6e02:16ca:b0:2c6:7857:a0c4 with SMTP id
 10-20020a056e0216ca00b002c67857a0c4mr4314890ilx.97.1647598319422; Fri, 18 Mar
 2022 03:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220315232428.4982-1-woshoxxx@gmail.com>
In-Reply-To: <20220315232428.4982-1-woshoxxx@gmail.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 18 Mar 2022 18:11:23 +0800
Message-ID: <CAJy-AmkSuuUA5Wk52s3afq2B9c4HY9FfbLnkwDDB2giEBKPppg@mail.gmail.com>
Subject: Re: [PATCH v3] docs/zh_CN: Fix typo in process/howto.rst
To:     Zhou Yuheng <woshoxxx@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQpPbiBXZWQsIE1hciAx
NiwgMjAyMiBhdCA3OjI2IEFNIFpob3UgWXVoZW5nIDx3b3Nob3h4eEBnbWFpbC5jb20+IHdyb3Rl
Og0KPg0KPiBDb3JyZWN0IHRoZSB1cmwgb2YgbGludXgtbmV4dA0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBaaG91IFl1aGVuZyA8d29zaG94eHhAZ21haWwuY29tPg0KPiAtLS0NCj4gIERvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3MvaG93dG8ucnN0IHwgMiArLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL2hvd3RvLnJzdCBiL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3MvaG93dG8ucnN0DQo+IGluZGV4
IDI5MDNkNzE2MS4uMTMzNGNkYjMyIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9wcm9jZXNzL2hvd3RvLnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL2hvd3RvLnJzdA0KPiBAQCAtMjUyLDcgKzI1Miw3IEBA
IExpbnV4LW5leHQg6ZuG5oiQ5rWL6K+V5qCRDQo+ICDlnKjlsIblrZDns7vnu5/moJHnmoTmm7Tm
lrDlkIjlubbliLDkuLvnur/moJHkuYvliY3vvIzpnIDopoHlr7nlroPku6zov5vooYzpm4bmiJDm
tYvor5XjgILkuLrmraTvvIzlrZjlnKjkuIDkuKoNCj4gIOeJueauiueahOa1i+ivleWtmOWCqOW6
k++8jOWFtuS4reWHoOS5juavj+WkqemDveS8muaPkOWPluaJgOacieWtkOezu+e7n+agke+8mg0K
Pg0KPiAtICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL++8n3A9bGludXgva2VybmVsL2dp
dC9uZXh0L2xpbnV4LW5leHQuZ2l0DQo+ICsgICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
P3A9bGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0DQo+DQo+ICDpgJrov4fov5nn
p43mlrnlvI/vvIxMaW51eC1uZXh0IOWvueS4i+S4gOS4quWQiOW5tumYtuauteWwhui/m+WFpeS4
u+e6v+WGheaguOeahOWGheWuuee7meWHuuS6huS4gOS4quamguimgQ0KPiAg5bGV5pyb44CC6Z2e
5bi45qyi5YaS6Zmp55qE5rWL6K+V6ICF6L+Q6KGM5rWL6K+VTGludXgtbmV4dOOAgg0KPiAtLQ0K
PiAyLjE3LjENCj4NCg==
