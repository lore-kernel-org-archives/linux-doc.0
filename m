Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EECC6FD18
	for <linux-doc@archiver.kernel.org>; Wed, 19 Apr 2023 22:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbjDSWeZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Apr 2023 18:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjDSWeZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Apr 2023 18:34:25 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C6410D5
        for <linux-doc@vger.kernel.org>; Wed, 19 Apr 2023 15:33:50 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-54f8af6dfa9so3802967b3.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Apr 2023 15:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1681943486; x=1684535486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZrPULhZIKJV34C2bhX8PcgMIHgEG0C+dg13xBQhh0w=;
        b=BucwJja0NZZouiHsE6IPRymXHfvuN2GBpf0QYn9Cs4UXJmQWr2yTyDz9Sni6cXQ+KS
         Xad4+fwH0ZaJjAw8T641ngy+qwMOSbEyOeief8pa4za57y/iMMVYaWGo0mMV+S/Un443
         o07RiDXDWbUPjqUq6tAoSnYgCxaFj93eK4sMOmlJPumrGmc4naLgVCIsY+t1833jzsA8
         bDt1Whc4YXeVBHNcDG7uAwSrBJevfFOc8i+TiwayDT5NPfW9hzjokkRyUj5AYItgwhQr
         AFc0xlAGydRl4ENEgMnfS86yhCC1zMc0lqfJ3DpALd2NqEQlRrPiut7SlGyvxehYrJ3T
         YNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943486; x=1684535486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZrPULhZIKJV34C2bhX8PcgMIHgEG0C+dg13xBQhh0w=;
        b=UY5n1b11sIRAJ8keByTp5FMLM8G2uBxv/iQ52TACsHUc2jgWogPV1ND7WaWA9cfbII
         ufyi92WzKu/CKD5I58gSW7v/EVLHI9IaHk0YtoSZOfc78ZSJmZnKPR7kZOD6G7Euv9nB
         3Yh2ZQMgv/SNHUDbpoCxdDHSnTH9DOZ1CLRBfcgtsX4PSd0XzgwtwUIJnnJaMZgENScr
         ljDhguQtASXoW81emWBnD4OYKSWYVzzrvJGjyapWFAEarisItuqx91jVKfMfZzo8DjUL
         xI94gl6CxEWjR9y8OEcb7dOfKcMzmNJ4R2hJjjWCT3J5Kb7OXvG2vcIcHkeVLk/Wo8yu
         Ai7Q==
X-Gm-Message-State: AAQBX9e/g/1Vpp2x/fEXCoIMOchYUj+pUzfx/OiwNXt+Fz0G8nuMbQg7
        aiRsJ/YzOaD5itO9RPtBQxlMuI2Zls/I8KsRzQk=
X-Google-Smtp-Source: AKy350Yn+z+rdiDG8ySW4WCMw+0zQ/ws73YT2f1f1XxWKOrSMbU2byidZa3yVOwPBeUzkNz7+7uMJA==
X-Received: by 2002:a17:902:654a:b0:1a8:1c9a:f68 with SMTP id d10-20020a170902654a00b001a81c9a0f68mr3322962pln.36.1681942790785;
        Wed, 19 Apr 2023 15:19:50 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-41-174.pa.nsw.optusnet.com.au. [49.180.41.174])
        by smtp.gmail.com with ESMTPSA id ji2-20020a170903324200b001a4ee6ec809sm11964287plb.46.2023.04.19.15.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:19:50 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
        (envelope-from <david@fromorbit.com>)
        id 1ppG9T-005QFi-2w; Thu, 20 Apr 2023 08:19:47 +1000
Date:   Thu, 20 Apr 2023 08:19:47 +1000
From:   Dave Chinner <david@fromorbit.com>
To:     "Darrick J. Wong" <djwong@kernel.org>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux XFS Development <linux-xfs@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: xfs: Extend table marker on deprecated
 mount options table
Message-ID: <20230419221947.GU3223426@dread.disaster.area>
References: <20230419094921.27279-1-bagasdotme@gmail.com>
 <20230419151536.GM360895@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419151536.GM360895@frogsfrogsfrogs>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 19, 2023 at 08:15:36AM -0700, Darrick J. Wong wrote:
> On Wed, Apr 19, 2023 at 04:49:21PM +0700, Bagas Sanjaya wrote:
> > Sphinx reports htmldocs warning on deprecated mount options table:
> > 
> > /home/bagas/repo/linux-kernel/Documentation/admin-guide/xfs.rst:243: WARNING: Malformed table.
> > Text in column margin in table line 5.
> > 
> > ===========================     ================
> >   Name                          Removal Schedule
> > ===========================     ================
> > Mounting with V4 filesystem     September 2030
> > Mounting ascii-ci filesystem    September 2030
> > ikeep/noikeep                   September 2025
> > attr2/noattr2                   September 2025
> > ===========================     ================
> > 
> > Extend the table markers to take account of the second name entry
> > ("Mounting ascii-ci filesystem"), which is now the widest and
> > to fix the above warning.
> > 
> > Fixes: 7ba83850ca2691 ("xfs: deprecate the ascii-ci feature")
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> Looks good.  Dave, could you take this through the xfs tree whenever you
> push the duplicate #include fixes, please?
> 
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>

Applied.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
