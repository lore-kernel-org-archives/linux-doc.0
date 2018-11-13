Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 986EA7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 17:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732113AbeKND6p (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 22:58:45 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:32902 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731537AbeKND6o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 22:58:44 -0500
Received: by mail-qk1-f194.google.com with SMTP id o89so21013792qko.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Nov 2018 09:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P9DhjwRNoXjEAyQemgjipji/GQ3gr6vjKNMVUrxvbfE=;
        b=cHGLUudUf3fxuGsPSbUluKpVG26X3xXwdqwNEGkqYvbCMaxxlJuFDG/D7v0QTKf1O+
         2WW8Tb8JhRNIa1WhtxI164zFrFo5MD/tNu/HRwWIBVbwzU4hmq8XThLk+zAev56k7cfy
         tNm5dD15b6nwi4DdnXPz7ftEOY0a29/bAxJyzsTdmsUbUkKuZ/HBwPTCuzJdcbrkhWYI
         CKH/hRFeW89ymeWiQG6iVfMPpQu15d92689lskQx2f06BaN5ECiVEXpXuEBt/Fi8fgtI
         K69bWt02RUOPOV7wl/8/nAXeeu8Yl7ux4ODBO7BPMovzKCHeEVWTOR65fpHEvpforWga
         b6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P9DhjwRNoXjEAyQemgjipji/GQ3gr6vjKNMVUrxvbfE=;
        b=nuczi9BQpePXV9glML/ri6c6e1JQpllobb7U5tMuXOQgOjWrBpvIE6TtSTAP0vwtmw
         56TgR6I2Ej7V4CRiXssbKkbtaIqpfYouWuiKNvyujvnOUibgFqmvOqQd5B0Q1U0JRVeN
         tMCKaoWTgR1rIjDzCVhdWnrNPWDTKjXHip/hxmpjMwBFUroCYYDfB7F9IcMJq0hVzt1N
         03zIyVJMgBLs3sTtCu0AkwhLqsSwFbh6/J1IbFaDrlGKEAb+nNCnzKztKl6neXZVjOIi
         OWI4+zPjBwqu3y0oL71hKWoRrXxOvfKq9Z+ex3L+j9nw3/Egfu449zDmn5d5lYoxLExI
         vJFA==
X-Gm-Message-State: AGRZ1gJMyIMHqQH43WuzxN58dJl6SLpyxl4L2u/hSUW9XCa2No5+Ibdd
        Ly+fMLYd1qTaUFxBgrRaBIkP9A==
X-Google-Smtp-Source: AJdET5d5/8b0cPYhGAH/2uQ41Yrr1IDMnYVhiDpgCT/Dbx6nLJm1B5aP4qZKKue4XAs82Z3ncPbUwg==
X-Received: by 2002:a0c:b786:: with SMTP id l6mr6417096qve.244.1542131973659;
        Tue, 13 Nov 2018 09:59:33 -0800 (PST)
Received: from soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net ([40.117.208.181])
        by smtp.gmail.com with ESMTPSA id b8sm12820692qka.79.2018.11.13.09.59.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Nov 2018 09:59:32 -0800 (PST)
Date:   Tue, 13 Nov 2018 17:59:30 +0000
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     Oleksandr Natalenko <oleksandr@natalenko.name>
Cc:     jannh@google.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        timofey.titovets@synesis.ru, willy@infradead.org
Subject: Re: [PATCH V3] KSM: allow dedup all tasks memory
Message-ID: <20181113175930.3g65rlhbaimstq7g@soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net>
References: <CAG48ez0ZprqUYGZFxcrY6U3Dnwt77q1NJXzzpsn1XNkRuXVppw@mail.gmail.com>
 <d43da6ad1a3c164aa03e0f22f065591a@natalenko.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d43da6ad1a3c164aa03e0f22f065591a@natalenko.name>
User-Agent: NeoMutt/20180716
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18-11-13 15:23:50, Oleksandr Natalenko wrote:
> Hi.
> 
> > Yep. However, so far, it requires an application to explicitly opt in
> > to this behavior, so it's not all that bad. Your patch would remove
> > the requirement for application opt-in, which, in my opinion, makes
> > this way worse and reduces the number of applications for which this
> > is acceptable.
> 
> The default is to maintain the old behaviour, so unless the explicit
> decision is made by the administrator, no extra risk is imposed.

The new interface would be more tolerable if it honored MADV_UNMERGEABLE:

KSM default on: merge everything except when MADV_UNMERGEABLE is
excplicitly set.

KSM default off: merge only when MADV_MERGEABLE is set.

The proposed change won't honor MADV_UNMERGEABLE, meaning that
application programmers won't have a way to prevent sensitive data to be
every merged. So, I think, we should keep allow an explicit opt-out
option for applications.

> 
> > As far as I know, basically nobody is using KSM at this point. There
> > are blog posts from several cloud providers about these security risks
> > that explicitly state that they're not using memory deduplication.
> 
> I tend to disagree here. Based on both what my company does and what UKSM
> users do, memory dedup is a desired option (note "option" word here, not the
> default choice).

Lightweight containers is a use case for KSM: when many VMs share the
same small kernel. KSM is used in production by large cloud vendors.

Thank you,
Pasha
