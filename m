Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 537BB7D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 26 Sep 2018 18:41:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbeI0A4B (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 26 Sep 2018 20:56:01 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:43160 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725733AbeI0A4B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Sep 2018 20:56:01 -0400
Received: by mail-yb1-f193.google.com with SMTP id w80-v6so11756778ybe.10
        for <linux-doc@vger.kernel.org>; Wed, 26 Sep 2018 11:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=xqg/CVetFeXQTY4DjT1EB9i5OooEB9rin8OAQqBGHzo=;
        b=eBrM57gmEuBUCJgvWR+FauV7mvo98YY+yLH4livL48BdJN/SaRFsCKrnJgs+cwpp9V
         8fIfNEMy29AGfwcssoo3cgyFrbjwYf9fqINcPNMZ2JhTk+xijfaL+SEQ8UfRKevqBn/B
         kSaxNkWsBnFIb/FaVHunbb0trfghPgoJ9wCYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=xqg/CVetFeXQTY4DjT1EB9i5OooEB9rin8OAQqBGHzo=;
        b=fsVo8J46zqlwtdaRdkSXSpPXyy1rz04npZ2gYL6yylkHAhvn0EGjK8PzWIqjKWd9I8
         BEYF4GgF1+OSstDSp51BEj2ia376fs4I2Objp0HvHQzDuF54pvIDxVM2bcN3er+ZOCf4
         JikejXBPg6whOS7BnG1dRO57srDpDS02jbSbeTqOzgYOqzejpix4Yl3ZOUb30zhN9lSg
         dwJtNDf13T+4WA4aL2gu5OFidWc9Bz5MyjR9M35taAQQSfMnbFk5dH4cq7QMCIpXCAs5
         NuL2kwnF4/wnpG84pCKURFHcJl6zROluzIvI56/BgCq/LqVYg3HaDV6/Q1y74IwJi7ac
         6AJw==
X-Gm-Message-State: ABuFfohfECbn1OOCoc4tU/Kcs8lOZCX9jPnByEmu4iMUXPKpUSpuGQfP
        +ERKYZiEru79l/rcQqGEQpejiBx8rCo=
X-Google-Smtp-Source: ACcGV618jkIIEl1ReSVnCjdj9KY8FFVFZCkE0/IR6DbeUPLkd4H9gNwd9f5YoTlzx9KRZxkPSpsz9A==
X-Received: by 2002:a25:db0c:: with SMTP id g12-v6mr4021256ybf.391.1537987303330;
        Wed, 26 Sep 2018 11:41:43 -0700 (PDT)
Received: from mail-yw1-f43.google.com (mail-yw1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id a145-v6sm8566229ywh.100.2018.09.26.11.41.42
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Sep 2018 11:41:43 -0700 (PDT)
Received: by mail-yw1-f43.google.com with SMTP id y76-v6so1519ywd.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Sep 2018 11:41:42 -0700 (PDT)
X-Received: by 2002:a81:98d7:: with SMTP id p206-v6mr3768461ywg.353.1537986923019;
 Wed, 26 Sep 2018 11:35:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:ab0a:0:0:0:0:0 with HTTP; Wed, 26 Sep 2018 11:35:21
 -0700 (PDT)
In-Reply-To: <20180926123522.4080d9eb@vmware.local.home>
References: <20180925001832.18322-1-keescook@chromium.org> <20180925001832.18322-5-keescook@chromium.org>
 <20180926123522.4080d9eb@vmware.local.home>
From:   Kees Cook <keescook@chromium.org>
Date:   Wed, 26 Sep 2018 11:35:21 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJyL7FuLRj1XxujpGs9=wUQgS4dRfeGB+HUBqy4mkEBhQ@mail.gmail.com>
Message-ID: <CAGXu5jJyL7FuLRj1XxujpGs9=wUQgS4dRfeGB+HUBqy4mkEBhQ@mail.gmail.com>
Subject: Re: [PATCH security-next v3 04/29] LSM: Remove initcall tracing
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Abderrahmane Benbachir <abderrahmane.benbachir@polymtl.ca>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 26, 2018 at 9:35 AM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Mon, 24 Sep 2018 17:18:07 -0700
> Kees Cook <keescook@chromium.org> wrote:
>
>> This partially reverts commit 58eacfffc417 ("init, tracing: instrument
>> security and console initcall trace events") since security init calls
>> are about to no longer resemble regular init calls.
>
> I'm not against the change, but how much are they going to "no longer
> resemble regular init calls"?

My take on "regular" init calls is that they're always run, link-time
ordered, etc. The changes proposed here will make it so not all
initialization are run depending on runtime configurations, ordering
will be flexible, etc.

-Kees

-- 
Kees Cook
Pixel Security
