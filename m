Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557EAECAAA1
	for <linux-doc@archiver.kernel.org>; Tue,  6 Sep 2022 02:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbiIFCU3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Sep 2022 22:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbiIFCU2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Sep 2022 22:20:28 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308532A713
        for <linux-doc@vger.kernel.org>; Mon,  5 Sep 2022 19:20:27 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id v26so15270465lfd.10
        for <linux-doc@vger.kernel.org>; Mon, 05 Sep 2022 19:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=JM+u37djEQRb9R46HRmoMBdTms/tCJxVvjQ7V2rlp4w=;
        b=IIQGyCgRpGhBUI+TPOp2mTS/R1IGjpY0DuXfo43RBwtzWmWy0T51HCQz43oBrHwY1I
         398iPZMcIjE6h9qNyntaPQwHv00oxalJPJt7yVtZrUAPUfIZ1mfXVIpnsjZ4DT+Sx3zP
         y5dnEuw4Bkp8M4TGqg12oTOVZW9Fg+wI6ENeNc461v6VcxmRMr69ZAYZz1A1+Pmp3Pqj
         EW6ek5/Ec4xUSvDVBnKKN9qY+a3EaSwufHu1G7Vro3L5X78W9m/RiLxixAi4nZrDIDTQ
         l0wV4s7yTZYw1sFhF8KmQSdPaa5kfmPhNxb+ySZaE8yL5J03Dnv2xwSvZamQXujLUWnZ
         OpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JM+u37djEQRb9R46HRmoMBdTms/tCJxVvjQ7V2rlp4w=;
        b=IhNx4+Tj2Z1wJu9Gn/5eUbWYR+wPLYRORVRLLzTL+FufAiO2c9kOgs/CKDRxCuuA49
         yQPoNIo7xebEHGWZ226BpjpA1divRDW8ZXQgZcebM/Z8r3EW4noU2+O9a05Mnqr8TBKn
         okCQitDKJDYXoXUjFQCo/2z+Jfz3OjAZ98tj9Ln0At83je3fFFn9S+vlPDh3LpzbrHH0
         v348L5ckBx8M7TCri1Yum+zBhwAGtwPshqSgux27r6DBThxa6rcxOZmowsjw7uE+0xcQ
         1gpqWwDgSKq+JPy84MFzv8j+tulB3oQM47tt7NdVKuJseQ1wqleCxnO3s7RMOFgxMb4C
         o/Jg==
X-Gm-Message-State: ACgBeo1GHlUGcYrTHZHk/EAWIU4SZrVdoVT+kSAW91iQC+hv1DuSWT2b
        rMeque/433wrDc/XFPHd0Srl7eTxIbdl5H353a8=
X-Google-Smtp-Source: AA6agR4l6HgRPWntetsPFHnyMx+zgXUYnmCh6/eLITLSoOj9XXE69K6IO+01G/HMYQ1j5g054cdDicODNiQYe04Iu6w=
X-Received: by 2002:a19:5e01:0:b0:492:c03a:aa8e with SMTP id
 s1-20020a195e01000000b00492c03aaa8emr18740699lfb.139.1662430825457; Mon, 05
 Sep 2022 19:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662022757.git.siyanteng@loongson.cn> <b872e46c98551f94bdae4a8a5f3ed328b9070bd4.1662022757.git.siyanteng@loongson.cn>
 <YxH9b+m8iRn/GRH2@bobwxc.mipc> <65774b2e-0a58-590d-0be3-84e8fb9a22da@loongson.cn>
 <YxYmvxbCIuFV8S0O@bobwxc.mipc>
In-Reply-To: <YxYmvxbCIuFV8S0O@bobwxc.mipc>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 6 Sep 2022 10:19:48 +0800
Message-ID: <CAJy-AmnANW+FRQ6Th5PULg=kq-vpYPL=B4dtV9rErj9nK4xRww@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] docs/zh_CN: add PCI acpi-info translation
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>
Cc:     YanTeng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVHVlLCBTZXAgNiwgMjAyMiBhdCAxMjo0MSBBTSBXdSBYaWFuZ0NoZW5nIDx3dS54aWFuZ2No
ZW5nQGxpbnV4LmRldj4gd3JvdGU6DQo+DQouDQo+DQo+IOS7peWPiuaIkeacrOadpeS4jeaDs+iv
tOeahOS4gOeCue+8jOaKiuKAnOOAjOacieeglOeptuaYvuekuu+8jOaJk+Wtl+eahOaXtuWAmeS4
jeWWnOasouWcqOS4reaWh+WSjOiLseaWh+S5i+mXtOWKoOepug0KPiDmoLznmoTkurrvvIzmhJ/m
g4Xot6/pg73otbDlvpflvojovpvoi6bvvIzmnInkuIPmiJDnmoTmr5TkvovkvJrlnKggMzQg5bKB
55qE5pe25YCZ6Lef6Ieq5bex5LiN54ix55qE5Lq657uT5ama77yMDQo+IOiAjOWFtuS9meS4ieaI
kOeahOS6uuacgOWQjuWPquiDveaKiumBl+S6p+eVmee7meiHquW3seeahOeMq+OAguavleern+eI
seaDhei3n+S5puWGmemDvemcgOimgemAguaXtuWcsOeVmeeZveOAgg0KPiDkuI7lpKflrrblhbHl
i4nkuYvjgILjgI3igJTigJR2aW50YS9wYXJhbm9pZC1hdXRvLXNwYWNpbmfigJ3ov5nnp43kuJzo
pb/mlL7lnKjmlZnnqIvlvIDlpLTvvIzlrp7lnKjkuI0NCj4g5piv5LuA5LmI5aW95Li75oSP77yM
5oiR5bu66K6u57uZ5Ye65Y+C6ICD5paH54yu44CC5ZCm5YiZ5oiR5bCx5b6X6K+04oCc5pyJ56CU
56m25pi+56S677yM5omT5a2X55qE5pe25YCZ5Zac5qyi5Lmx5YqgDQo+IOepuuagvOeahOS6uu+8
jOS4gOiIrOWkp+iEkemDveavlOi+g+epuueZve+8jOacieS4g+aIkOeahOavlOS+i+S8muWcqDM0
5bKB55qE5pe25YCZ6KKr5YWs5Y+45LyY5YyW77yM6ICM5YW25L2Z55qEDQo+IOS4ieaIkOacgOWQ
juWPquiDveWOu+W9k+S6p+WTgee7j+eQhuOAguavleern+aAneiAg+i/meenjeS4nOilv+aYr+S4
jeiDveWcqOepuueZveWfuuehgOS4iuWxleW8gOeahOOAguS4juWkp+Wutg0KPiDlhbHli4nigJ3v
vIzmnYPlvZPljZrlkITkvY3kuIDnrJHjgIINCj4NCg0K5ZOI5ZOIIOeskeatu+aIkeS6hg0K
