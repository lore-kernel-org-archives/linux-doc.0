Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 99B387D088
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 15:14:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbeJKWmH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Oct 2018 18:42:07 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:36525 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727546AbeJKWmG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Oct 2018 18:42:06 -0400
Received: by mail-yw1-f68.google.com with SMTP id e201-v6so3719719ywa.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Oct 2018 08:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=vhHOhK6qIvD03E5j82CJydF0koblL9qnnu+X5reyDNk=;
        b=hGmW4Qvy01/0H+oeR2sl6jaevIREHbKsBEeL0KgYGYQVDxkg3lguRP1SCw0IB6mIEM
         lcd9gOlmm+cx38qOiw+KFjaAweXG14NOjliA2sDOs3WJoL7RKDrGdDEFBEwiDMjwPNDH
         CUSMpMk/UmVS/aA67+3zE8Mn15lZsTiNbaGas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=vhHOhK6qIvD03E5j82CJydF0koblL9qnnu+X5reyDNk=;
        b=kFdErrSHL6yGav18+Gq2hxq82F7MP+W/1O4B18yY5b8DhBc/kiBcYmRegIe/jsJK/Y
         2hUr3UxNvSrYrgNPirHDgieR/pp7aKMzERLTzBkre0hsAb/AEbx8Q7LCbgD+cN+IVxpK
         nFRBLnT4NRRz4vwavOX9CmM+gHoh9mlUaHEcRZBzPdEtitbvDz95S7/ncQLgRPgJal6D
         fVt6p1WO/jhPgYnXgUHBX2rn7q41ebhNufvjYo2LCY9qzVoHaltq7NB4DDn+jHhuuish
         8leslALDFkLa9wh2g4QH4LfPwO4ci+NOEsjUf63s/cp401G7NByyUNGLP/vAgJaeb9wC
         JULg==
X-Gm-Message-State: ABuFfojlKzKtsc4xQa0E88OMXyTfof2HLJ9nkukiO2uHbH9VxtJV8+VH
        uClxarQrc//n0w9RelQ0G4rgwGujtDU=
X-Google-Smtp-Source: ACcGV63iVhP+9koRlUCO1nr8X002fdUA/WFxg/JtJuJArWGLXzlZVRC2kMXPPGOwi8lnV9muYlYMXw==
X-Received: by 2002:a0d:f302:: with SMTP id c2-v6mr1096385ywf.337.1539270869788;
        Thu, 11 Oct 2018 08:14:29 -0700 (PDT)
Received: from mail-yw1-f44.google.com (mail-yw1-f44.google.com. [209.85.161.44])
        by smtp.gmail.com with ESMTPSA id u79-v6sm16329904ywe.110.2018.10.11.08.14.26
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Oct 2018 08:14:26 -0700 (PDT)
Received: by mail-yw1-f44.google.com with SMTP id j75-v6so3714831ywj.10
        for <linux-doc@vger.kernel.org>; Thu, 11 Oct 2018 08:14:26 -0700 (PDT)
X-Received: by 2002:a81:98cb:: with SMTP id p194-v6mr1074104ywg.353.1539270865726;
 Thu, 11 Oct 2018 08:14:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Thu, 11 Oct 2018 08:14:24
 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.21.1810111443500.25845@namei.org>
References: <20181011001846.30964-1-keescook@chromium.org> <alpine.LRH.2.21.1810111443500.25845@namei.org>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 11 Oct 2018 08:14:24 -0700
X-Gmail-Original-Message-ID: <CAGXu5jLzsYY1Ja8onnNdHXbenZ6vPrat_L8U_sbcCic0qk--qQ@mail.gmail.com>
Message-ID: <CAGXu5jLzsYY1Ja8onnNdHXbenZ6vPrat_L8U_sbcCic0qk--qQ@mail.gmail.com>
Subject: Re: [PATCH security-next v5 00/30] LSM: Explict ordering
To:     James Morris <jmorris@namei.org>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Paul Moore <paul@paul-moore.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jordan Glover <Golden_Miller83@protonmail.ch>,
        LSM <linux-security-module@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 10, 2018 at 8:45 PM, James Morris <jmorris@namei.org> wrote:
> On Wed, 10 Oct 2018, Kees Cook wrote:
>
>> v5:
>> - redesigned to use CONFIG_LSM= and lsm= for both ordering and enabling
>> - dropped various Reviewed-bys due to rather large refactoring
>
> Patches 1-10 applied to
> git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git next-general
> and next-testing.

Very cool; thanks!

As for the rest, I could post some examples of how the new CONFIG_LSM
and "lsm=..." work (and how they mix with the "legacy" options). Would
that be helpful?

-Kees

-- 
Kees Cook
Pixel Security
