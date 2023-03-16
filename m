Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB93AC6FD19
	for <linux-doc@archiver.kernel.org>; Thu, 16 Mar 2023 17:31:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjCPRbS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Mar 2023 13:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjCPRbQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Mar 2023 13:31:16 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD9FC2DAB
        for <linux-doc@vger.kernel.org>; Thu, 16 Mar 2023 10:30:54 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id cn21so10832401edb.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Mar 2023 10:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1678987852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YryrzFP9xzjyk98MIHgDswzk42M925/BWmA7MtQw0v4=;
        b=iA846uojjKEV++zy4HZ7Rt5GItD/Qjg78d/gKmMT98RgBUi0lemkA3Wwqw0HjdgE8r
         6kJJvp5ZTNlHVEezJOUg0IrhWWQ71Vy1RNRCsr11tEd83excEtWgMkjNzKEiMvb2AouX
         UVqRloUFwDgseRI2J1OQZ+aJoJc2OKGMJzoNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678987852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YryrzFP9xzjyk98MIHgDswzk42M925/BWmA7MtQw0v4=;
        b=AJkTKe/gd4lwzbTBk0g6MWChDfqC3X3M7rWq6n+HSNLBbfDSfJT/JO9kSbKtY1ZTCH
         lYwyOm2Y5lsaFkMXJ8N/myyT44P/5p0x1rxut2aO1+Ox8DBhal886Q6aoNDxlKlg7J7Q
         C/rF98nf413a7lII5s4mEaEHbunWAVmB3PpC9npaKn1HgTxWUUW7SGNASjDIFkMzyQjR
         PxvgCj4gpAqjuKH/Kwe5ObEJgkQGGSEJdHrjeQfdepgDF3Hb5M4LjIln1VEC5em5TLxI
         XZIoxArI4WoZ3Vt+HebTZQyXzyZmFdDcjHcbJBYKqc3OKsozx1ImB8oHCyG9nwVXZBm6
         TNJQ==
X-Gm-Message-State: AO0yUKVUz2LTEVllsIhX08mnx7T+PQ6AOuDSVavg/6SLBHKnWffTKlCd
        fAcGMWftcQJWSPKAxNmVjholJcD14Po8bqHiIaPc9w==
X-Google-Smtp-Source: AK7set9FSB1LQ/kpLB02NGroVc488eLLD0r7hz6ePPZcLwlhrVM1Ze8/8Ql9YytZHiQOVD5PlDG3pQ==
X-Received: by 2002:aa7:c315:0:b0:4fb:221b:eade with SMTP id l21-20020aa7c315000000b004fb221beademr305651edq.35.1678987852420;
        Thu, 16 Mar 2023 10:30:52 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id w3-20020a50c443000000b004ac54d4da22sm28164edf.71.2023.03.16.10.30.51
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 10:30:51 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id o12so10566891edb.9
        for <linux-doc@vger.kernel.org>; Thu, 16 Mar 2023 10:30:51 -0700 (PDT)
X-Received: by 2002:a17:907:2069:b0:8af:4963:fb08 with SMTP id
 qp9-20020a170907206900b008af4963fb08mr5816749ejb.15.1678987850768; Thu, 16
 Mar 2023 10:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
 <c27709bd-90af-ec4f-de0b-3a4536bc17ca@leemhuis.info> <81f8be3e-4860-baf9-8e13-fec3a103245b@tessares.net>
In-Reply-To: <81f8be3e-4860-baf9-8e13-fec3a103245b@tessares.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 16 Mar 2023 10:30:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh0v1EeDV3v8TzK81nDC40=XuTdY2MCr0xy3m3FiBV3+Q@mail.gmail.com>
Message-ID: <CAHk-=wh0v1EeDV3v8TzK81nDC40=XuTdY2MCr0xy3m3FiBV3+Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] docs & checkpatch: allow Closes tags with links
To:     Matthieu Baerts <matthieu.baerts@tessares.net>
Cc:     Thorsten Leemhuis <linux@leemhuis.info>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        =?UTF-8?Q?Kai_Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 16, 2023 at 4:43=E2=80=AFAM Matthieu Baerts
<matthieu.baerts@tessares.net> wrote:
>
> @Linus: in short, we would like to continue using the "Closes:" tag (or
> similar, see below) with a URL in commit messages. They are useful to
> have public bug trackers doing automated actions like closing a specific
> ticket. Any objection from your side?

As long as it's a public link, I guess that just documents what the
drm people have been doing.

I'm not convinced "Closes" is actually any better than just "Link:",
though. I would very much hope and expect that the actual closing of
any bug report is actually done separately and verified, rather than
some kind of automated "well, the commit says it closes it, so.."

So honestly, I feel like "Link:" is just a better thing, and I worry
that "Closes:" is then going to be used for random internal crap.
We've very much seen people wanting to do that - having their own
private bug trackers, and then using the commit message to refer to
them, which I am *violently* against. If it's only useful to some
closed community, it shouldn't be in the public commits.

And while the current GPU people seem to use "Closes:" the right way
(and maybe some other groups do too - but it does seem to be mostly a
freedesktop thing), I really think it is amenable to mis-use in ways
"Link:" is not.

The point of "Link:" is explicitly two-fold:

 - it makes it quite obvious that you expect an actual valid web-link,
not some internal garbage

 - random people always want random extensions, and "Link:" is
_designed_ to counter-act that creeping "let's add a random new tag"
disease. It's very explicitly "any relevant link".

and I really question the value of adding new types of tags,
particularly ones that seem almost designed to be mis-used.

So I'm not violently against it, and 99% of the existing uses seem
fine. But I do note that some of the early "Closes:" tags in the
kernel were very much complete garbage, and exactly the kind of thing
that I absolutely detest.

What does

    Closes: 10437

mean? That's crazy talk. (And yes, in that case it was a
kernel.bugzilla.org number, which is perfectly fine, but I'm using it
as a very real example of how "Closes:" ends up being very naturally
to mis-use).

End result: I don't hate our current "Closes:" uses. But I'm very wary of i=
t.

I'm not at all convinced that it really adds a lot of value over
"Link:", and I am, _very_ aware of how easily it can be then taken to
be a "let's use our own bug tracker cookies here".

So I will neither endorse nor condemn it, but if I see people using it
wrong, I will absolutely put my foot down.

                    Linus
