Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 73F3E7D082
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Oct 2018 17:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbeJYBb6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 24 Oct 2018 21:31:58 -0400
Received: from mail-lj1-f170.google.com ([209.85.208.170]:38754 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbeJYBb6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Oct 2018 21:31:58 -0400
Received: by mail-lj1-f170.google.com with SMTP id k11-v6so5466695lja.5
        for <linux-doc@vger.kernel.org>; Wed, 24 Oct 2018 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5CnRgWo1UO4bGmD4InqiDFs61Ck554zCZy6ouI3oj2Q=;
        b=RRuKTB8pA9jtoIpgnI4SlFP1gmq3d6sfJl6gkRtgdQW4+22SW6RtBUeLUfPLG2ZUU4
         Ov86rVSFr9dwn5pfF90tEBYVtcoUs78w8kvz0w4hK4SlnDXgaxQM0JL+AQQUxa+sqBJt
         xGk2GwmWJfgjgjODWWzFY5CI7moB7f0Kf+GDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5CnRgWo1UO4bGmD4InqiDFs61Ck554zCZy6ouI3oj2Q=;
        b=aOLLbx8zEDeHlcNy8w3s1G83b51p64woGUApPJbSx2QPQSdhwApXcwiAC4jX4d8ihB
         KKZTP9FqMK6r/ppzV/oWjB6Z2TOlIg7A2VzCQQmcwqdiQpUz2E+AcHFPgZSSFlN94uRM
         1fY6xolpHmL0bXBPfCfe7R/DDxbm5+JiE09uVV8M+zWT3Y30wKD53XEBm2PlmAOeNRxl
         YcM9PdsE7OF2Z3AQeymFT7kb7fcPXEFBS7llJ4SkQ0yK2b+k6DtxW9LBjkLki5k4vRq9
         9kXjiACv9pqNUV12FV+igdS8VCUvpPzIgHklMhi6Jo8IKoB//nFVaorrreX5pnow0Pzz
         Q0tA==
X-Gm-Message-State: AGRZ1gJYVg+7etJ2K4Yv68nMQSj+OkDRoFF/b0OlrkoopUgM+Wfx/DLz
        iLhL/4eK7Tedci1dIff89blBspzlAQCsiCYT
X-Google-Smtp-Source: AJdET5fG1D0iu1728v1/v0TDP918HPwrIFovrthemVZSKdqd7vmeyHaqkcaia7bhCVDp6AeodF1pIg==
X-Received: by 2002:a2e:9547:: with SMTP id t7-v6mr2303848ljh.63.1540400586418;
        Wed, 24 Oct 2018 10:03:06 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id r81-v6sm797681lff.43.2018.10.24.10.03.05
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Oct 2018 10:03:05 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id l1-v6so4571975lfc.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Oct 2018 10:03:05 -0700 (PDT)
X-Received: by 2002:a19:111b:: with SMTP id g27mr16525259lfi.135.1540400584955;
 Wed, 24 Oct 2018 10:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20181023021126.41bdb1e0@lwn.net>
In-Reply-To: <20181023021126.41bdb1e0@lwn.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 24 Oct 2018 18:02:47 +0100
X-Gmail-Original-Message-ID: <CAHk-=wiOWBJVC4che1ZN1dyFR7vNiW_C7LrdGe+LjGW+uZs+3A@mail.gmail.com>
Message-ID: <CAHk-=wiOWBJVC4che1ZN1dyFR7vNiW_C7LrdGe+LjGW+uZs+3A@mail.gmail.com>
Subject: Re: [GIT PULL] Documentation for 4.20 (or whatever it's called)
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 23, 2018 at 9:11 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> This is a fairly typical cycle for documentation.  There's some welcome
> readability improvements for the formatted output, some LICENSES updates
> including the addition of the ISC license, the removal of the unloved and
> unmaintained 00-INDEX files, the deprecated APIs document from Kees, more
> MM docs from Mike Rapoport, and the usual pile of typo fixes and
> corrections.

Pulled,

                Linus
