Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3D2907DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 03:08:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754028AbeEHDID (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 23:08:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:57098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753935AbeEHDIC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 23:08:02 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0EB5C2173F;
        Tue,  8 May 2018 03:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1525748882;
        bh=MXivwNzVBwWniOH3SsiQ9zdmzulDJgRDuyYhP3O3OHs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pE1s3ceJsXWWbwX3aaImXnYt4haw0ADJ1SpEHWxSbIHKuBRY8tbL/aunJZog9QQbu
         1g3WQk9gpjXkQpW/Pn9Mw8whm07z+saeiIcOeDrwdTwdTWrBzP776ANSJUETuvHc6X
         Zi88s86nk1fNekI8LZxyYZaY5i4IWihiZfgHwrEs=
Date:   Tue, 8 May 2018 05:07:48 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 17/18] docs: uio-howto.rst: use a code block to solve a
 warning
Message-ID: <20180508030748.GD1882@kroah.com>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <65bca40bfd11c80cd13224f2e4309ff4f1ad05aa.1525684985.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65bca40bfd11c80cd13224f2e4309ff4f1ad05aa.1525684985.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 07, 2018 at 06:35:53AM -0300, Mauro Carvalho Chehab wrote:
> /devel/v4l/docs/Documentation/driver-api/uio-howto.rst:715: WARNING: Unexpected indentation.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
