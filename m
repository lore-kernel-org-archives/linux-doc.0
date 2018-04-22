Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 608D17E279
	for <lwn-linux-doc@archive.lwn.net>; Sun, 22 Apr 2018 16:09:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753944AbeDVQIl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 22 Apr 2018 12:08:41 -0400
Received: from mail-io0-f171.google.com ([209.85.223.171]:44497 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753910AbeDVQIh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Apr 2018 12:08:37 -0400
Received: by mail-io0-f171.google.com with SMTP id d11-v6so7832175iof.11;
        Sun, 22 Apr 2018 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=+TfLXmFiXOZCKOD61J3Xd7sBC3Ov3ope4bpQNWUHMwk=;
        b=u50cD841UWwkSGrKkuY50633eJnYxssmr7NyVA32cJlvMk55cofCXf1r/OE7NJFlqF
         mUnKiY4zi9cSPIsTVk7RCz1XAWVhvBLSFbYQt27OaKMTA9357RJCAd2QVqIIFqU4Ta51
         Hz/3Yne+zySK0OdtupnnlYH+dfKFGfe4Pyae+dHxgthdBHg3RGJfOcv+1Uiqv4ypAfR9
         7b+Ad9kaOYtoBzV6fcub+AG7xMcHIx6ArNrNwFCzheVuRv1TWJZ9zBXcC/Uyr/T40g3a
         TgSu/sfoJaBDoWUSfnG/4mewxSo/2UFWGENi+2sp7cTOv1Tr1GwjGE0Zse5//HaaVwVm
         gN8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=+TfLXmFiXOZCKOD61J3Xd7sBC3Ov3ope4bpQNWUHMwk=;
        b=hiIB1GOsI+4GFEG7upvbC1tkjda7fd6nUG1v9QYLJOUXS7EEzag0upumuKEmaQ38YM
         mI0M/j4TP3Y1mKmi9nZ9kQar1jN5Tuc2iSLnxDWl9/cooH8JZJkDCAneIOMGXEfgiesY
         IG+zUG2J90C0VlSyLEKuNRNDuTuP/ZaNpK5qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=+TfLXmFiXOZCKOD61J3Xd7sBC3Ov3ope4bpQNWUHMwk=;
        b=tATemGnaS4wUgNI0ETyzuDthEwzQO2nB5ymDybuDtBWWAssbAtG/GjsM7weE/1h1jf
         n9glNFdrasTFWZWQqpGAwB5D3ysiuHMcjdMACdCSHZX+A/degxcVRj/wf4GqtYLhJSdJ
         2lKc2O/gHtxxmRAcjQwJ91vAV1t5R+nk7WjB4wFATk+zJstgxkWkfsjDslyI7ONVzgOV
         7eWKNjucjaK7tppSiZQGCAgiN+N/usBm/w26D7spPSm+vr2wKtOn4N2t25W1Ny7LwzXw
         7mVqdrkME/oFd267JXp0eHqASRCbD3wLX2k/GHAP/1YmB+NcTba04f0eSR4JsA0ZXSbs
         5qOw==
X-Gm-Message-State: ALQs6tAeRNcBKkCbteUKlWM+Sy2muWcH1adWihxyP1c1BJHozBYqvT45
        tg84sYT/+HZgsKTx+ZLVtlULBaMf/lx/YjuJ9xIh5A==
X-Google-Smtp-Source: AIpwx4/64c8le1afmjr0l4Ptl/JW1NuNVJWlStEKSXWdv6yivB7tuFzuG6lA+t9Kyxf9n9kS4RPWaqnBqtXoeaUguGs=
X-Received: by 2002:a6b:4604:: with SMTP id t4-v6mr19621417ioa.203.1524413316913;
 Sun, 22 Apr 2018 09:08:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.95.15 with HTTP; Sun, 22 Apr 2018 09:08:36 -0700 (PDT)
In-Reply-To: <20180422100032.GA18114@amd>
References: <20180307214624.D4361772@viggo.jf.intel.com> <20180309204526.56301f43@alans-desktop>
 <CA+55aFw5+KjVqKUpAMF+-BfE6NuXSNb8qdRtmAWDq6apK2v+sA@mail.gmail.com> <20180422100032.GA18114@amd>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 22 Apr 2018 09:08:36 -0700
X-Google-Sender-Auth: aTPrn_y5elTt7_NA4St1gOXyLng
Message-ID: <CA+55aFwXrH-NiwUhxj_F-uTv2PfA28mD4gsLwZY12HTxSn-rkw@mail.gmail.com>
Subject: Re: [PATCH] [v2] docs: clarify security-bugs disclosure policy
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Andrew Lutomirski <luto@kernel.org>,
        Kees Cook <keescook@google.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Apr 22, 2018 at 3:00 AM, Pavel Machek <pavel@ucw.cz> wrote:
>
> On Fri 2018-03-09 13:15:31, Linus Torvalds wrote:
>>
>> Oh, I don't want to be taken seriously by people who use gpg
>> encrypted email.
>
> Heh. I see that gpg has some usability problems, but we do encrypt our
> http connections, and email is at least as sensitive.

It's not about sensitivity.

It's about the technology actually *working*.

PGP does not work for email. Never has, never will. It's unusable
crap. Nobody sane uses it, because the cost is just too damn high.

Make it as easy to use as https, and things will change. As it is,
don't even bother.

Thomas helped me get S/MIME working, and even for that I had to fix an
alpine bug that caused alpine to SIGSEGV. And that's _convenient_
compared to pgp email. Whee.

             Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
