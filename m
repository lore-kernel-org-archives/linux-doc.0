Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 27E977D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 Oct 2019 16:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbfJAQ1i (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 Oct 2019 12:27:38 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43290 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfJAQ1i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Oct 2019 12:27:38 -0400
Received: by mail-pf1-f196.google.com with SMTP id a2so8358854pfo.10
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2019 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d9N6vaaaQB6e9m9d5xIkw24KtfIxR6Ljh0jNYbRk6l0=;
        b=FEoihbMzNm3LaB1U4ipVYKLf2ahPZ3AFM42lw2q2155l0E/L8L5VwvW6ftP2iGQ64j
         JEJ7/UsUTzI8ydmeb1EIpNjd8kYZI1pXoHPMGHNqmWwqKWhKBII7JnS/+AV4trscSr7+
         X87h/ZbCG4Pw2n77Kz7GGU+9Weeo9ufEEETHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d9N6vaaaQB6e9m9d5xIkw24KtfIxR6Ljh0jNYbRk6l0=;
        b=Bm1mJGfGHVeUSGogxSUg8tPyVGvWpDjGPRM8KKHVBwwh3F2nWXXAzVP54pT6rFeg73
         DyvXJwNn8uV+slaGGWte7we5JRfNCTbejPKanLgLBWTW+mIkSbOAUCUZ4aefowuR2vYa
         sH+1p/UmRZDx5g7PC6albgqmryhbJGpuiDYxqRjVFDMGoKfvrm10co1ZDIOEEAoRRPv5
         Uqr2Rj2yNfcD5Hs4rnIcctcwCU+ZZ8BZS8sAjOF9Gco5r4GRuigqA+cW3unF8Gg5BU8M
         S9pYgMfTQmsHG4/pGQfpwHmgxxSAZm1OlysWoKiQWiXld3g5aTsoB9ClB9yFJ7Cp9ZN9
         r/fA==
X-Gm-Message-State: APjAAAWEMAFEuP0I1xKvxcNPhmz+vTI7H6WBtFSbWDJSdBT9u4YxAjCW
        BhR25Kjiz+WMn2YP1IvsDb0kSw==
X-Google-Smtp-Source: APXvYqxG1Bz6yEsE4RiwKNa0vHJR5W4O91ll4jEmWEHJBinSTR6hwUPAV4sdaH48bL62/n8xbxkl/Q==
X-Received: by 2002:a17:90a:8a02:: with SMTP id w2mr6525701pjn.117.1569947257947;
        Tue, 01 Oct 2019 09:27:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t11sm2965799pjy.10.2019.10.01.09.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 09:27:37 -0700 (PDT)
Date:   Tue, 1 Oct 2019 09:27:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] docs: Programmatically render MAINTAINERS into ReST
Message-ID: <201910010916.8B8248222@keescook>
References: <20190924230208.12414-1-keescook@chromium.org>
 <20191001083147.3a1b513f@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001083147.3a1b513f@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 01, 2019 at 08:31:47AM -0600, Jonathan Corbet wrote:
> On a separate note...it occurred to me, rather belatedly as usual, that
> last time we discussed doing this that there was some opposition to adding
> a second MAINTAINERS parser to the kernel; future changes to the format of
> that file may force both to be adjusted, and somebody will invariably
> forget one.  Addressing that, if we feel a need to do so, probably requires
> tweaking get_maintainer.pl to output the information in a useful format.

That's a reasonable point, but I would make two observations:

- get_maintainers.pl is written in Perl and I really don't want to write
  more Perl. ;)

- the parsing methods in get_maintainers is much more focused on the
  file/pattern matching and is blind to the structure of the rest
  of the document (it only examines '^[A-Z]:' and blank lines), and
  does so "on demand", in that it hunts through the entire MAINTAINERS
  file contents for each path match.

So I don't think it's suitable to merge functionality here...

-- 
Kees Cook
