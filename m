Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984F2C7EE2D
	for <linux-doc@archiver.kernel.org>; Fri,  2 Jun 2023 16:11:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236887AbjFBQLS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Jun 2023 12:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236797AbjFBQK5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Jun 2023 12:10:57 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5268810E6
        for <linux-doc@vger.kernel.org>; Fri,  2 Jun 2023 09:10:11 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4eed764a10cso2992327e87.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Jun 2023 09:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1685722190; x=1688314190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeFT72TXfXAwhYRh1W0GvqbmonxTxhIBsAfBN2yDsw0=;
        b=d5xN3B8XR5vGIWsQm4Vs7a1dtkZNy5nYvd4LEWmq6303Q6HHrfgEmFxPsToRFiRxl5
         511Ba2q1rBQypNVdPN6W8NB2gRGACwVHpOj9QC/TmIU3XJckfJIU3tzW6+RooU5If8OP
         kyijF1OfAHU2QzGjZ3FLl/SKtByZVA30ZELec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722190; x=1688314190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeFT72TXfXAwhYRh1W0GvqbmonxTxhIBsAfBN2yDsw0=;
        b=kV5T05tEuRGk/KtNH1xfzarYUEVPXvUZ0B8zp8LJpwtBRca+HL1r/KBFWFz5/ZDOss
         nQRhIPUafmQ6n4EolB4vpUzIHn5BNQ62QxaT/iaLslblBTPy2dJazMN9CcUe4RIQCJ7M
         xWTGcoogAOoMzHx9JaORgelcgkh1yg1Nst/K5+0yEWx5Wv08OuLMSiv0D4M26dhUQLs+
         lnE2OYemH4gc3SZZ5da1ZN8pClnu02CpP9IZH3J/+ZpPWVbWGqH+sbnjdbmDgeBTwuJz
         Fcf/g+II/m3NJ04FwqiByJ+X2xBJerjyVZd/cREzBqDHDcm5+VoInrEDegkJyVGU8G9C
         Nd9w==
X-Gm-Message-State: AC+VfDz8UJqn3Bzqf4aPXUDVRNC+ZhADUV+vSIHlr4YfVnD3W4QJ9+W6
        OWjMVwz/VXJY8N/+5Buucl9LipxKGru7LD857GDssqj7
X-Google-Smtp-Source: ACHHUZ6P6ObhJJyctnaY7I9b/VUTSVYOl9AuUxbnuU/8/y+3LCvlSKus+NBxoCoTOjQ4R1SEfKYW9w==
X-Received: by 2002:a05:6512:14b:b0:4f6:171e:493 with SMTP id m11-20020a056512014b00b004f6171e0493mr334659lfo.8.1685722190457;
        Fri, 02 Jun 2023 09:09:50 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id p2-20020a05651211e200b004d4d7fb0e07sm201318lfs.216.2023.06.02.09.09.49
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 09:09:49 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f60a27c4a2so2564656e87.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Jun 2023 09:09:49 -0700 (PDT)
X-Received: by 2002:ac2:5d6c:0:b0:4f2:509b:87ba with SMTP id
 h12-20020ac25d6c000000b004f2509b87bamr2034590lft.50.1685722168361; Fri, 02
 Jun 2023 09:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230531130833.635651916@infradead.org> <20230531132323.722039569@infradead.org>
 <70a69deb-7ad4-45b2-8e13-34955594a7ce@app.fastmail.com> <20230601101409.GS4253@hirez.programming.kicks-ass.net>
 <14c50e58-fecc-e96a-ee73-39ef4e4617c7@gmx.de> <CAHk-=whL65CLuy9D9gyO608acM5WLWo_ggAMP1cGu2XvyC0-hA@mail.gmail.com>
 <20230602143912.GI620383@hirez.programming.kicks-ass.net>
In-Reply-To: <20230602143912.GI620383@hirez.programming.kicks-ass.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 2 Jun 2023 12:09:11 -0400
X-Gmail-Original-Message-ID: <CAHk-=wj7K3Q9WbBtQHiOXKc04SRjeOF+TRopkwVoQh_CFU+kvg@mail.gmail.com>
Message-ID: <CAHk-=wj7K3Q9WbBtQHiOXKc04SRjeOF+TRopkwVoQh_CFU+kvg@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] parisc/percpu: Work around the lack of __SIZEOF_INT128__
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Helge Deller <deller@gmx.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>, dennis@kernel.org,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
        Heiko Carstens <hca@linux.ibm.com>, gor@linux.ibm.com,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        borntraeger@linux.ibm.com, Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Joerg Roedel <joro@8bytes.org>,
        suravee.suthikulpanit@amd.com, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Baolu Lu <baolu.lu@linux.intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-s390@vger.kernel.org, iommu@lists.linux.dev,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-crypto@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>,
        Sam James <sam@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 2, 2023 at 10:40=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Something like so then?

Ack. I think it would be much cleaner if we would have it as part of
the Kconfig file and architectures could just override some
GCC_MIN_VERSION value, but that's not the universe we currently have,
so your patch looks like the best thing to do.

              Linus
