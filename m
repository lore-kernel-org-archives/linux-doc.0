Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D11BEB64D8
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jun 2023 18:28:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbjFMS2b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jun 2023 14:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjFMS23 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jun 2023 14:28:29 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B0110CC
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 11:28:28 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5147e40bbbbso8806235a12.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 11:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686680906; x=1689272906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c13OqGThZo2X78u4bO5FLqEGNspfbVSXUjccgWtSHTY=;
        b=bj0eAgReK1rz2YvIsysbZI4REZKwTwavtfzTGkbwIdYEOO6rdiVTCfqL6HY9yFyxoL
         DkcqEV6dz6b8Vu2Ssd7P5DuIbtngR5yhr/FS7ipKSzteNHOOhJUjTvjOSvOA6Q3QkOaM
         OpcETy/dEMkN5kiLPvqCfEcGfY319ZqvlfjwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686680906; x=1689272906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c13OqGThZo2X78u4bO5FLqEGNspfbVSXUjccgWtSHTY=;
        b=NOkFESBXRPLx9nRdxUfPHgfo7ROxtUfoNDiCRo7Bxl5XWysbCJUzH876Yh6oREuxK/
         Kw0MRKpuyCpdp5VBgjShWYEtFPWFP9w41LdWoFxnob5jlF72EdkHHAKzm+K40Yh6ZR0Y
         Tg/csnwgPiwdMn8iMhP/qn21nni4+TASDeZV9mK5enmwzTnksi4HbQGwCEe3RBz2QV9K
         HMOavJSAtdm5nxikLLpLL1QZw20UItV4tSkJY/rYKliplk5Ss4Bxg/LHTMesEwXLpwfa
         tJ+GjmqHfu+TBYoG5JPDDtQfNVkPB9Lxn0+C5G3iOrb4YW6quG/25Ov1fD7Zx3FzABd0
         Rlvw==
X-Gm-Message-State: AC+VfDydGcD/Cdk0QVygL7h4QMX/rEeL+W1fBVi4LYbHEBZm91qfNV1Q
        UIYsUgIWeaXqgfRFptztkJJJEn/lgxLLBheoN09kWRhp
X-Google-Smtp-Source: ACHHUZ6w7fRrYyvPJGCZZs6YIepeYGZnpURJNx1Fh84Jp87kkteEydBftjs14r1fpUeJL504SsIArg==
X-Received: by 2002:a17:907:6d08:b0:978:992e:efc4 with SMTP id sa8-20020a1709076d0800b00978992eefc4mr12056356ejc.8.1686680906631;
        Tue, 13 Jun 2023 11:28:26 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id p6-20020a1709061b4600b00977e4c1727esm6940360ejg.29.2023.06.13.11.28.24
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 11:28:25 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5184abe9e86so2772591a12.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 11:28:24 -0700 (PDT)
X-Received: by 2002:a19:3819:0:b0:4f7:457e:a457 with SMTP id
 f25-20020a193819000000b004f7457ea457mr3476722lfa.53.1686680882933; Tue, 13
 Jun 2023 11:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
 <CAHk-=wh0UNRn96k3XLh2AYOo0iz1k_Qk-rQXv8kYjXkKBzUMWA@mail.gmail.com>
 <c239d2c4f7e369690866db455813cac359731e1d.camel@intel.com> <CAHk-=wjSWhVV+qr_tV0xg8c0WRn_H9wtFZkUVCpv-VzsddAS-Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjSWhVV+qr_tV0xg8c0WRn_H9wtFZkUVCpv-VzsddAS-Q@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 13 Jun 2023 11:27:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=whY0ggV9P+3Ch1LcqefnS3=O7FmWkOPoiABD7QJGtwSHg@mail.gmail.com>
Message-ID: <CAHk-=whY0ggV9P+3Ch1LcqefnS3=O7FmWkOPoiABD7QJGtwSHg@mail.gmail.com>
Subject: Re: [PATCH v9 00/42] Shadow stacks for userspace
To:     "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc:     "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "kcc@google.com" <kcc@google.com>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "nadav.amit@gmail.com" <nadav.amit@gmail.com>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "david@redhat.com" <david@redhat.com>,
        "Schimpe, Christina" <christina.schimpe@intel.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jannh@google.com" <jannh@google.com>,
        "dethoma@microsoft.com" <dethoma@microsoft.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>, "bp@alien8.de" <bp@alien8.de>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
        "john.allen@amd.com" <john.allen@amd.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
        "rppt@kernel.org" <rppt@kernel.org>,
        "bsingharora@gmail.com" <bsingharora@gmail.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "oleg@redhat.com" <oleg@redhat.com>,
        "fweimer@redhat.com" <fweimer@redhat.com>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "gorcunov@gmail.com" <gorcunov@gmail.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "szabolcs.nagy@arm.com" <szabolcs.nagy@arm.com>,
        "hjl.tools@gmail.com" <hjl.tools@gmail.com>,
        "debug@rivosinc.com" <debug@rivosinc.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "Syromiatnikov, Eugene" <esyr@redhat.com>,
        "Yang, Weijiang" <weijiang.yang@intel.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "Eranian, Stephane" <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 13, 2023 at 10:44=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Anyway, I'm scanning through it right now. No comments yet, I only
> just got started.

Well, it all looked fine from a quick scan. One small comment, and
even that was just a minor stylistic nit.

I didn't actually look through the x86 state infrastructure side -
I'll just trust that is fine, and it doesn't interact with anything
else, so I don't really worry about it. I mainly care about the VM
side not causing problems, and the changes on that side all looked
fine.

             Linus
