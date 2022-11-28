Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC04C4332F
	for <linux-doc@archiver.kernel.org>; Mon, 28 Nov 2022 19:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbiK1TvJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Nov 2022 14:51:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233310AbiK1TvI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Nov 2022 14:51:08 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54642C642
        for <linux-doc@vger.kernel.org>; Mon, 28 Nov 2022 11:51:06 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id w9so7451732qtv.13
        for <linux-doc@vger.kernel.org>; Mon, 28 Nov 2022 11:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3rVjFGtlRHBM5QlNpTClMrk+4erU6KpoR1fdEwcvnTg=;
        b=ExLWnXsPTjrF9DJq6FfIFtngbJ0G0vKlF5sh0cDlSMITvmrfLWNGSmhYhuVfAgbpmh
         RX3NQfNPvus3n+cILrzw0p65mtZUml0N58sHqgLfN2tqOu9v9eMGy5auU7AqB/uIilBg
         bawS7tGo3xMqhRY4fTl1o041GKpSEn+RY6LA9mWkdRN4+LyziFqfGdki75V3suTyL8oy
         umtyoYJzq3ZeL9wScd2BI0uLY9h2TOrCbVUKkrxILQx6vfKuvbqIgEUj8k/r1fGTUXr4
         gcqpk4zPdF1AYk8A0dC4wuvoFrBzWTFZ7Vu5G1hwp4A0CADzN8RMVfnmj8MoW9WUImwB
         wf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rVjFGtlRHBM5QlNpTClMrk+4erU6KpoR1fdEwcvnTg=;
        b=l0ZGDEVkoZmLWZvUTi/uI6TrQDCvA8jtX7BeEn48tngRUlQaPBCS/xYFkN1tXNlEmv
         I94xHgy7oCjDDCFDH3xTL6jHEVF/KjS9JbLHe+pJ0Bhy+TsNmUfq5EzWM5vQPQbM51nQ
         lYVw6ifAnLxtzwjg7aPOlmX8tE+tVkgmei1JQm5fPfrdgvMQIjWE0uXsktub6hh/H+TL
         PrSApvZAcrrMUwQBXQMIZ4n8mf1KX4X3WWSJ56wBkdpbCen+PwBeDhPdb18EtBpIs0VX
         5q68ddcBAtIpgZhZG7BAre+UeC87dldOedlJh5lF6B591EvxolSp5ZHRxw2PljbaI7VJ
         G9ww==
X-Gm-Message-State: ANoB5plyKZfcvta8SDV3U0d6ho0rz5rN1LFna/GiVWEe3UEmsiFigKjB
        B9rGGAl6PEmLkdB7B0imjwWvNoYFXv0=
X-Google-Smtp-Source: AA0mqf7vQk3rLxbxYpRRtHiv6QvzgsTEJqGMKn1yFx7CCLOjlEgASOosJkZ4QdbmG7VJrJB3wKLd4A==
X-Received: by 2002:ac8:687:0:b0:3a5:41fd:2216 with SMTP id f7-20020ac80687000000b003a541fd2216mr50754760qth.338.1669665065680;
        Mon, 28 Nov 2022 11:51:05 -0800 (PST)
Received: from hurd ([2607:fad8:4:3::1004])
        by smtp.gmail.com with ESMTPSA id w21-20020a05620a0e9500b006faa88ba2b5sm8873004qkm.7.2022.11.28.11.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 11:51:05 -0800 (PST)
From:   Maxim Cournoyer <maxim.cournoyer@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] doc: specify an 'html' build sub-directory for
 the htmldocs target
References: <20221116190210.28407-1-maxim.cournoyer@gmail.com>
        <20221116190210.28407-3-maxim.cournoyer@gmail.com>
        <8735ac9evv.fsf@meer.lwn.net> <87tu2sou3d.fsf@gmail.com>
        <874juj6p3y.fsf@meer.lwn.net>
Date:   Mon, 28 Nov 2022 14:51:04 -0500
In-Reply-To: <874juj6p3y.fsf@meer.lwn.net> (Jonathan Corbet's message of "Mon,
        28 Nov 2022 09:05:53 -0700")
Message-ID: <87wn7esvrr.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Jonathan Corbet <corbet@lwn.net> writes:

> Maxim Cournoyer <maxim.cournoyer@gmail.com> writes:
>
>> Hi Jonathan,
>>
>> Jonathan Corbet <corbet@lwn.net> writes:
>>> I think I'm going to hold off on this one.  As I said before, it would
>>> have made sense to do things this way when we made the transition.  At
>>> this point, though, I think the potential for trouble outweighs the
>>> benefits that would come from moving things around in this way.
>>
>> OK.  The potential for troubles would lie with the scripts to deploy the
>> doc to the web site, I'd guess?  If that's the place we'd expect
>> problems, I'm happy to be pointed to it and can try adjusting the
>> scripts for the change.
>
> The trouble lies in any number of scripts at any number of sites;
> calling this an ABI change would be a stretch, but some of the same
> concerns apply.

Right.  I wouldn't be too concerned with sites other than the main Linux
documentation site, though?

> Getting the docs build on kernel.org updated would not be a huge
> problem, I think, but I don't know what else might break.
>
> We can reconsider this, but not before the merge window.

Understood.  Thanks for the follow up!  Should I resend when the next
window opens?

-- 
Thanks,
Maxim
