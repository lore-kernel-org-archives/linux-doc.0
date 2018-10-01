Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D84D7D087
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Oct 2018 23:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbeJBGaS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 02:30:18 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:33874 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbeJBGaS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 02:30:18 -0400
Received: by mail-yw1-f65.google.com with SMTP id m129-v6so64917ywc.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 16:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=2ohEmpld1IFXjpF8PrBFP4qTkcM2P6AcoHxxKbyBNVM=;
        b=b5pSpTqR8TmSGggikp7xyF+snqMrJPH1p7e2lE+1eU7X9y0Z6OFHDpZcPaucVlYuNP
         nRK3vFBfzv60PdkYhhoUyz8uzMQt5WyH7tj/80NkYdGBqXOXpC8u5OPbEtnG1N2ct9is
         OkDfeKDCsH4kAPyJHnMm/NGh3kiYzLLRdQN9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=2ohEmpld1IFXjpF8PrBFP4qTkcM2P6AcoHxxKbyBNVM=;
        b=DwxflTcniQ8EW6fSPBDdNahTXjkwsOXjFbSnQygzAfBwcwzSZs+VTn1+tRUwvgXF6d
         3db0B7R67ZNr6w7H+oJGkSQWSB7GueqxFUsnhLJ+CSRRgYR2cEc4C2Ixq9ls8TZhNIDe
         F+dybnIrDSfU0HNYora3aLewK0uRdMwtdhwNXOhVWiSbCp5L3qUM4j7UhD31TnYz7l9/
         6RiSA9+Xx9FpZTKTGX7EspAW7l8A7QPdPOTQI0GwE+EOcUStq4hq+bs9W+ct4gBHo1P+
         jD1T9OaijxmSkBD5FFxNbL4MCxx+hVHOfzmeEGslHW5STEa+Xlip4ONVzX/M0ZGFeoUc
         xaiA==
X-Gm-Message-State: ABuFfogj5UjiBGSrJvUKqVhjuEUReAii8scMLavXUAlC6vu/25HdfflY
        zPcKpFona3YvwT6net7o4fjcATsEu5E=
X-Google-Smtp-Source: ACcGV60fgw5sbLczyjJJor75pwIWhu6b9InfPa0eTAH5SStxjnqVhqASwW4xyBh2DmwAkjZzQhmcpQ==
X-Received: by 2002:a81:77d5:: with SMTP id s204-v6mr4548181ywc.233.1538437801301;
        Mon, 01 Oct 2018 16:50:01 -0700 (PDT)
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id g81-v6sm5956091ywe.109.2018.10.01.16.49.58
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Oct 2018 16:49:59 -0700 (PDT)
Received: by mail-yw1-f41.google.com with SMTP id e201-v6so60820ywa.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 16:49:58 -0700 (PDT)
X-Received: by 2002:a81:1194:: with SMTP id 142-v6mr7356787ywr.168.1538437798500;
 Mon, 01 Oct 2018 16:49:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Mon, 1 Oct 2018 16:49:57 -0700 (PDT)
In-Reply-To: <b2952ffe-545f-931f-e6a2-589be5ac8ac0@canonical.com>
References: <20180925001832.18322-1-keescook@chromium.org> <20180925001832.18322-19-keescook@chromium.org>
 <68e4e323-3216-7e77-2807-c3207126ae68@canonical.com> <CAGXu5j+jzmFh-iuXDVHQTq7e=mftpfaqS-45TP_UR3B+qtGcLQ@mail.gmail.com>
 <9b3e1733-7cfa-5047-1422-0f9d92d88d39@canonical.com> <CAGXu5jJheexJgnJ+OWaDoRFraqm9yxj1Vr290tfZ7kELBPUpAw@mail.gmail.com>
 <b2952ffe-545f-931f-e6a2-589be5ac8ac0@canonical.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 1 Oct 2018 16:49:57 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJr8P_rS+DcQJxMM9xnB0vFFc75Xrk7Qv9yx8_DLB1Vjg@mail.gmail.com>
Message-ID: <CAGXu5jJr8P_rS+DcQJxMM9xnB0vFFc75Xrk7Qv9yx8_DLB1Vjg@mail.gmail.com>
Subject: Re: [PATCH security-next v3 18/29] LSM: Introduce lsm.enable= and lsm.disable=
To:     John Johansen <john.johansen@canonical.com>
Cc:     Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        LSM <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 1, 2018 at 4:44 PM, John Johansen
<john.johansen@canonical.com> wrote:
> On 10/01/2018 04:30 PM, Kees Cook wrote:
>> If we keep it, "apparmor=0 lsm_enable=apparmor" would mean it's
>> enabled. Is that okay?
>>
> ugh I would rather get rid of apparmor=0 or to emit a warning with apparmor
> disabled, but if we have to live with it then yes I can live with last
> option wins

Removing it would be much preferred! :)

Assuming Paul is okay with the same results in SELinux, I'll prepare patches...

-Kees

-- 
Kees Cook
Pixel Security
