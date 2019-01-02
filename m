Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5072A7D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Jan 2019 15:56:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbfABP4O (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 10:56:14 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:45341 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfABP4N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jan 2019 10:56:13 -0500
Received: by mail-yw1-f65.google.com with SMTP id d190so12163768ywd.12;
        Wed, 02 Jan 2019 07:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BGyphusPVmyKOgfZwxPiTbaMVHhwPo7VwZbqrFW8CcE=;
        b=ZJmiamyfEykbygxcmx1H/pBXb2S+Y27xQBlWUHC5VqCkFnsNGFJnjxifThDyyFOysc
         vYGVBZw0AaKxyL0fE8xKiF0PWBCBh787PgKPOZKjWNT1+bCnLfsVFa1F5NHpStL963du
         B/1K6siD90E7ui48l6uFXuofc/0eDDX3yBjCQXry4WjyKLt5Bu8SbE5F8CnAWz+DHmbI
         J6ZUKdhf/SkLCKBPoY6phZfJrBk8kGL7mNlMiQe8spxp/yntRf0bTdVHIvZyy/ZGl8hi
         QEAIOtjMGx1qhWWCBRqpDxfMYG2P0va9MosLBZpe08ccwqmSX3h8fx8tUmv3RHW3PY1O
         w/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=BGyphusPVmyKOgfZwxPiTbaMVHhwPo7VwZbqrFW8CcE=;
        b=IzQXzd4mYM6UNJwPiwf/h4rqOwUTl9b7sCfsA/OFkzwHpZCmRS2EHoTeBtIUGXdTYX
         7PsW55PHZM3DURbj7inDAr/7NRJ00ijJS9BRYODESBk2AVJPpiOU++rj40gMNHVofEdC
         vppSBd87HfKW3pN+nOtCkIHmcdOjZafEh1MpQ5+2QkQYzzIsd4Aryxf6VVearap4qpmZ
         emJIhwPmufvklVh1TXBC1siv/tz+ArhKAnntrKZq6LufJnUUnxEbPLSfpaBCvJ1yUt1y
         Z2HYYYhBWJ/5nT+YSmtd8yOsTFBDY3NfQ5sk3shVDjfWoO6EkZ+7B4rRkBMp8gTt7i3m
         w8bA==
X-Gm-Message-State: AA+aEWZ+JnJEYWV7k7X8gRmlimTeiu0MasrHRqhDa/zPA7a/aKF3GO7T
        TvSosrG843pldqtfPDtXAbI=
X-Google-Smtp-Source: AFSGD/VHrUaqjeLArUm5QnP7Eec02Dd0/gC7BbjYv4/UqnjIbFeAfjU8A/RCHnDhUMKx3NAp8cRPvA==
X-Received: by 2002:a81:33c4:: with SMTP id z187mr45695055ywz.294.1546444572622;
        Wed, 02 Jan 2019 07:56:12 -0800 (PST)
Received: from localhost ([2620:10d:c091:200::6:f03d])
        by smtp.gmail.com with ESMTPSA id 141sm20524815yws.47.2019.01.02.07.56.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Jan 2019 07:56:11 -0800 (PST)
Date:   Wed, 2 Jan 2019 07:56:09 -0800
From:   Tejun Heo <tj@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Otto Sabart <ottosabart@seberm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] doc: cgroup: use graphviz code instead of ASCII art
Message-ID: <20190102155609.GO2509588@devbig004.ftw2.facebook.com>
References: <20181230164945.GA2644@personal>
 <20181230104020.1074d807@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181230104020.1074d807@lwn.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Dec 30, 2018 at 10:40:29AM -0700, Jonathan Corbet wrote:
> On Sun, 30 Dec 2018 17:49:45 +0100
> Otto Sabart <ottosabart@seberm.com> wrote:
> 
> > The graphviz looks better. This patch also fixes multiple build warnings:
> > "WARNING: Block quote ends without a blank line; unexpected unindent."
> > 
> > Signed-off-by: Otto Sabart <ottosabart@seberm.com>
> 
> The graphviz looks better *in some settings*, such as the formatted
> version of the docs.  Please remember, though, that we need to preserve
> the readability of the plain-text documents as well, and my own feeling
> is that this patch is a step backward in that regard.  I'll defer to
> Tejun on this if he feels otherwise, but my sense is that this is not
> something we want to do.

Yeah, I'd much prefer to prioritize source file readability.  My
anecdotal experience is that most folks read the text file directly.

Thanks.

-- 
tejun
