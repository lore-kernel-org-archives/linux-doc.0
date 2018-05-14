Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,FSL_HELO_FAKE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 572E27D0DC
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 May 2018 09:49:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752096AbeENJtX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 May 2018 05:49:23 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33527 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751780AbeENJtU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 May 2018 05:49:20 -0400
Received: by mail-wr0-f194.google.com with SMTP id o4-v6so11602597wrm.0;
        Mon, 14 May 2018 02:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cWKP+5eD1ivpJiA2Ly3oiHwzl4Pm3VcgCS51KLtrETg=;
        b=CrRIVFAzTNPAI/bGdPStRFocIQHoiVb1aVHbQcfJRJ8rd3Vi2Sd6aj2ZnUIjfpaBPU
         xxGvid17SLwcfiwlgUQ4Wk9fVvlkX4w3QNwtldVMy89kwT3mjECvVS42gl7MslvwO4H1
         sOQRGcCjzWb5/3msMqs2kDqLbWjQd4So+PzLFg6imBDpWcRWq41KLvgHUfOcNUBVFloG
         L5NqWUu9SWPRWYNsxqE/ixC5pMD2LbX+lK4bTKlJDIATmSJUacsVX/dk280D6fEfZkLx
         RqWT/pobkkd09gOc1rIOrF/KgdohNKBP0q6bM1NPlE0UxOcyy80WNoJTOjlVCyg4h2+m
         +XoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=cWKP+5eD1ivpJiA2Ly3oiHwzl4Pm3VcgCS51KLtrETg=;
        b=S4vNUNYKhk2wsqYcDaCN/UIwbIa24KHiHZFZ400dm1tfgZg7LSeNXBxAmwTr8JIq4u
         K82kqhxupBzg55lbXHCJCMNyBR8W2So6cROPURdpSUAlV5K1gB0TORAgT+eoYyCGb8mF
         M9ZnbJk0hbSG08Tvezo2VQtXh7XmMBQhshMYjOO8NLCbGnjc2vunNpT5nyKtF4eQqlIg
         +78qVlBRXoEPrg4fPkCYPkJ49uegcdLuEcmktTJINoGzidF9DSJYx02onCvuTc1xrbdd
         2SV9wgWMrwgOVGLSdbb54YhT8kSU/Ab1h02ERKNpM8jKFLd5t1PsVX96dIrR6LlTDewh
         VIng==
X-Gm-Message-State: ALKqPwcK0dOJaxBj/LXra18zpjY49393vfG13sZ1j6QQbQuO2KzNuXZr
        9fYesm67Mnj8qCUmuLp3k7wOVA==
X-Google-Smtp-Source: AB8JxZozs6iY7dNb+0yMk24OCi3c2ytzpsPZhRQUlkCr4bGCocF/TLX/tnid0YjXC4VSlGgTsxUi+Q==
X-Received: by 2002:adf:a70c:: with SMTP id c12-v6mr6146906wrd.140.1526291359532;
        Mon, 14 May 2018 02:49:19 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id v196-v6sm7388107wmf.36.2018.05.14.02.47.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 May 2018 02:47:48 -0700 (PDT)
Date:   Mon, 14 May 2018 11:47:14 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrea Parri <andrea.parri@amarulasolutions.com>,
        linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        paulmck@linux.vnet.ibm.com
Subject: Re: [RFC PATCH v3 0/6] Documentation/features: Provide and apply
 'features-refresh.sh'
Message-ID: <20180514094714.GA5951@gmail.com>
References: <1525689823-3340-1-git-send-email-andrea.parri@amarulasolutions.com>
 <20180508093045.7397f31c@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180508093045.7397f31c@lwn.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


* Jonathan Corbet <corbet@lwn.net> wrote:

> On Mon,  7 May 2018 12:43:37 +0200
> Andrea Parri <andrea.parri@amarulasolutions.com> wrote:
> 
> > This series provides the script 'features-refresh.sh', which operates on
> > the arch support status files, and it applies this script to refresh the
> > status files in place; previous discussions about this series are at [1].
> 
> Looks good, I've applied the set, thanks.

A belated:

  Reviewed-by: Ingo Molnar <mingo@kernel.org>

Thanks guys!

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
