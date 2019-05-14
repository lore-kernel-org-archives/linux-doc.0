Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7A1A57D912
	for <lwn-linux-doc@archive.lwn.net>; Tue, 14 May 2019 23:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfENXTJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 14 May 2019 19:19:09 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44070 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbfENXTJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 May 2019 19:19:09 -0400
Received: by mail-pl1-f196.google.com with SMTP id c5so328177pll.11
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2019 16:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=65cWsglVoepzFlykZ42+abk0YI6VmpB8isURvrndfio=;
        b=Bg39hYCrdxq9ZvR+2i/HlXSRaq6orpc1oOB8WF33oCVFV3rNh0CexWyS1Z8QPqlm8F
         634lbyY40ksqDjssWKmNVtGI+1F3APRXwSAL0XqoS1nJrYkqeYOkCUNp8JWFWm6ZNg2N
         3YnG2RckdXyh7Hd/JvDkJlfyEQP3VpBJF0SPvweC+YvdIQjG/OVFu00sC5S5PmUtedb0
         57OXt1xXLQFMEhV58WldO2KsTL77idwyKmIM1odUUjPKE4+37YyS67kBXQTSZPy0lER0
         iehTg4wcOiUIvCRTLfByhOie4AbWZpgc/tuXOmP4dOA/iaDvGuiNcBG7UtbS06g67YaV
         pQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=65cWsglVoepzFlykZ42+abk0YI6VmpB8isURvrndfio=;
        b=o/nXwU3W4fUy3m2YOVXn/Nz2pnIjtcA5cPb6VkDI5kIeXMPeZ/782NC1tmEOw5LKjk
         2TkZYjV4eCmFyzDDEeXXqW9570MDBCEd9eGzsHgUWPdcdC6YQ08fCze6aghgXP/gC2aD
         ft+tvwNHVwh6RmxZXOtq94M4NsMvllzG4NsuJe8U92A+7wmqw1g2QQ7aeAhG+8vW1jE9
         cfwobsgCqNIRo0U2HlagINkHFdIkIczOQ8W8MvuHKi1XErHGiEDe3Pj9oikTXCwhcmT/
         kEv6QRNTrU3tdY8VT6n/IhYT8LSRss8hvmv+SXAaZQvxAcR9VYd4HOwLBKQ8cO2diVnr
         DodA==
X-Gm-Message-State: APjAAAUVLaYS/R8NfFBLBFpYa4qasLLKQo49VXYgB0Oer5w+D1e5rfNH
        WjPn6MWt1pQitOKCBKtthTnE4w==
X-Google-Smtp-Source: APXvYqwRc6VN5ebH7uglXTpSRZvZHWA1IEE/QiHsPmobJB2SKK6EBwf8uUbYe/O8Vc0yLOYiPNp2/w==
X-Received: by 2002:a17:902:5998:: with SMTP id p24mr23416476pli.9.1557875948193;
        Tue, 14 May 2019 16:19:08 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:2:d714:29b4:a56b:b23b])
        by smtp.gmail.com with ESMTPSA id p64sm253565pfp.72.2019.05.14.16.19.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 14 May 2019 16:19:07 -0700 (PDT)
Date:   Tue, 14 May 2019 16:19:02 -0700
From:   Brendan Higgins <brendanhiggins@google.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        keescook@google.com, kieran.bingham@ideasonboard.com,
        mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com,
        dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com,
        joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com,
        knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au,
        pmladek@suse.com, rdunlap@infradead.org, richard@nod.at,
        rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com,
        Felix Guo <felixguoxiuping@gmail.com>
Subject: Re: [PATCH v3 15/18] Documentation: kunit: add documentation for
 KUnit
Message-ID: <20190514231902.GA12893@google.com>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-16-brendanhiggins@google.com>
 <20190514073422.4287267c@lwn.net>
 <20190514180810.GA109557@google.com>
 <20190514121623.0314bf07@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514121623.0314bf07@lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 14, 2019 at 12:16:23PM -0600, Jonathan Corbet wrote:
> On Tue, 14 May 2019 11:08:10 -0700
> Brendan Higgins <brendanhiggins@google.com> wrote:
> 
> > > Naturally, though, I have one request: I'd rather not see this at the top
> > > level, which is more than crowded enough as it is.  Can this material
> > > please go into the development tools book, alongside the kselftest
> > > documentation?

Hmmm...probably premature to bring this up, but Documentation/dev-tools/
is kind of thrown together.

It would be nice to provide a coherent overview, maybe provide some
basic grouping as well.

It would be nice if there was kind of a gentle introduction to the
tools, which ones you should be looking at, when, why, etc.

> > Oh yeah, that seems like the obvious home for this in hindsight. Sorry
> > about that. Will fix in next revision!
> 
> No need to apologize - I have to say the same thing to everybody :)
