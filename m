Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3C0F07D089
	for <lwn-linux-doc@archive.lwn.net>; Sun, 21 Oct 2018 15:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbeJUX0l (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 21 Oct 2018 19:26:41 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45235 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727465AbeJUX0l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 21 Oct 2018 19:26:41 -0400
Received: by mail-lf1-f65.google.com with SMTP id c24-v6so1993227lfi.12;
        Sun, 21 Oct 2018 08:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a3mWDxSSALVKP5O+CR+5JyQnxlv2NJ6m5gV3D8Nf2MI=;
        b=blJuIZyhaL+3YCmZ0AcP+i9Tx9uGLFjHilafz4yJzhR+L+ZUTtg55NU1NADvcQuwiB
         KIn8qs54WcTCY/Rl+IynMpgPpwdDq1zOX0I5nouqTPCvxNT1F/vLlTYTEgRX+ahZUAiG
         QFYbnFtDbFrzL9Cl55PwKDG3DF0dEoJLOOnBjBI28fi0Xts3ExNERdAGxxj20sZxeKAc
         lZts3igqBNqHnUgygmAOR4X/ZcZGWb/ldcMh79+wAxzercGqe6ML84+qpZODWcFHYJ3V
         SJDWTYh41kCS0YetlBsNIZMuY5cN8bOHrdfl5s3J7ZJDdALWNTRp1XmRHauEKMvX9sz4
         XwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a3mWDxSSALVKP5O+CR+5JyQnxlv2NJ6m5gV3D8Nf2MI=;
        b=bwkAnJFa5IlrH+loHYzxo5cTTfAu2dS2Is5wLeOkPfJyAfdmBW89Fnef7dkI8wJVqz
         Nzg231KxzXzp2WkfWRmEnuZJxPWmGXaVmbTyHEwdf040vXvc0CIn8jKFyp4EZBQz63/X
         A/hd6bvrolV1i1RYmz/tw+Xcq655i3csQqDhcXArEh9kdQQsocSmQykTHFAQIrLBS8Ga
         O9c8K66+zOKwnHzHt56aUaaUn7ABNzH/qycsa3XBzwYzUr3dLdkUiy5EBxG3JvvvOqxj
         Mp2vuBLW+reJ9U9T/H/sKpinAhUjX00a/ainjjlqmM376r49GqrO2jsbDWCmquEJQymt
         /mBA==
X-Gm-Message-State: ABuFfoicXhSwG0b0iV3tPSuISUaHA8XiZxeOVBe4Wmmc/x37IOGvRvD9
        q4RuNb9RmXv8VaTngb/bVuZQEmrdhAufmBRcd4Q=
X-Google-Smtp-Source: ACcGV61aFGSQFxu382vS4FnVfu5pJ6kpoETLc8LT033AS2xAzhQypTVxyxNyrEwjaTsQC+6L0cPVNmryp/Xb/VwD6VY=
X-Received: by 2002:a19:f813:: with SMTP id a19mr7161657lff.67.1540134721308;
 Sun, 21 Oct 2018 08:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20181017021708.GA22211@beast>
In-Reply-To: <20181017021708.GA22211@beast>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 21 Oct 2018 17:11:50 +0200
Message-ID: <CANiq72mh_3DsSWfTrUrz=XmBCNDFPFQGwxzzXD26h_-aGWxyiw@mail.gmail.com>
Subject: Re: [PATCH] docs: Introduce deprecated APIs list
To:     Kees Cook <keescook@chromium.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 17, 2018 at 4:20 AM Kees Cook <keescook@chromium.org> wrote:
>
> As discussed in the "API replacement/deprecation" thread[1], this
> makes an effort to document what things shouldn't get (re)added to the
> kernel, by introducing Documentation/process/deprecated.rst. It also
> adds the overflow kerndoc to ReST output, and tweaks the struct_size()
> documentation to parse correctly.

If you remember, please CC me as well, since I would like to be
involved in this as well, given that  it touches the compiler
attributes :-)

Also, I will send a patch (for the deprecated.rst file, adding a
section about fallthrough comments) later on.

Thanks for adding the file!

Cheers,
Miguel
