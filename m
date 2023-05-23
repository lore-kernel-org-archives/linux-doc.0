Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81F0C7EE26
	for <linux-doc@archiver.kernel.org>; Tue, 23 May 2023 09:00:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235364AbjEWJAp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 May 2023 05:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236284AbjEWJAn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 May 2023 05:00:43 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3351D138;
        Tue, 23 May 2023 02:00:38 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-623a5f60355so33668136d6.1;
        Tue, 23 May 2023 02:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684832437; x=1687424437;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IWyhD2FU+Ejglji5EaZHCBnC8MDzEeXxyvBYUlSpFcI=;
        b=Yy65T0RlyoUq4pONSBNpw63UjVXudmGenEIeL0lUKteSH0PRUDSsy4M+VKo4/HfDQa
         KXsJVfyF9zQmLZQOg1ICGoedYRGPqbe3SkKUyOtZzfc6K5eVU8JjNf1gPAeIsoJAMMzE
         Pcyobme0XE70hwaN3dY84fI0lNjhifcqQ4aKRMHJmgB5rHyvo7csMQmmbBOGtnaKVUCP
         SHys7cbcZt10Jxykn0eJ0UQD58GsREDgxhozjiYUh+7Qtntbdkm9zOILQxbr+/rlq9bl
         PcoOAGkFm4xsruIQOvPTLN/bRYnXVn/KxEe0+5F+qKvzbwAKbOXmkfIKuvf8R3UN2Pzo
         fYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684832437; x=1687424437;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWyhD2FU+Ejglji5EaZHCBnC8MDzEeXxyvBYUlSpFcI=;
        b=CzhdcD9rlwvSr4QgEK1TbwOdPFgZylDFgGo+s9Z51nIyDgdE7gdJqh0tCs5R1dLMQW
         TFEFdOl4AaU2kvLBBiQvqo+9vQgj/E8ezVz/dCb2XFXZURY58+ADHMX2cryTxUB6sNDr
         FugOkCiOqu/LKW1j7I9LjcQA+lc88QgYpAeUJNzhEUyfvvqzH4mpJiAZrObyLavS9N5a
         8DFyzAwQHs8D+IOzdRlwBAVAQHzsdxhx1CjZ9PNOYo0P29zaMsqYwQ1iEXuYFG49bmbT
         9EnhVF8NSmzDT55tRsLZBO+VUTbhtEdL+dFpqIw+NvRhlZirm0IZStE8Y/tFTCqJDAmh
         c97w==
X-Gm-Message-State: AC+VfDyUNK3oJ7/YRth2iNOynVeZHzOnnL3+4B7UfNNETWbxU3x7YEV3
        V35tiw6eFPDc0VpczKSR2NM=
X-Google-Smtp-Source: ACHHUZ6c0a2ZesgS0IGqU6UYXxOWmkaUsXGGMELri0gyuOa2/F55Lr5IffflWkTiaf/MGLPC2aG41w==
X-Received: by 2002:a05:6214:4007:b0:623:9efa:f12e with SMTP id kd7-20020a056214400700b006239efaf12emr17525400qvb.49.1684832437201;
        Tue, 23 May 2023 02:00:37 -0700 (PDT)
Received: from imac ([88.97.103.74])
        by smtp.gmail.com with ESMTPSA id ec17-20020ad44e71000000b0061668c4b426sm2602775qvb.59.2023.05.23.02.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 02:00:36 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        donald.hunter@redhat.com
Subject: Re: [patch net-next v1 2/2] tools: ynl: Handle byte-order in struct
 members
In-Reply-To: <20230522193826.48ecdd59@kernel.org> (Jakub Kicinski's message of
        "Mon, 22 May 2023 19:38:26 -0700")
Date:   Tue, 23 May 2023 09:22:43 +0100
Message-ID: <m2lehflang.fsf@gmail.com>
References: <20230521170733.13151-1-donald.hunter@gmail.com>
        <20230521170733.13151-3-donald.hunter@gmail.com>
        <20230522193826.48ecdd59@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> On Sun, 21 May 2023 18:07:33 +0100 Donald Hunter wrote:
>> Add support for byte-order in struct members in the genetlink-legacy
>> spec.
>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
>
> Which spec is this for? 

ovs_flow needs it and some rtnetlink specs I am working towards will
also need it.
