Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 66B7F7DE74
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 18:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751634AbeEJSkV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 14:40:21 -0400
Received: from mail-yw0-f171.google.com ([209.85.161.171]:41314 "EHLO
        mail-yw0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751610AbeEJSkU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 14:40:20 -0400
Received: by mail-yw0-f171.google.com with SMTP id q125-v6so839407ywc.8;
        Thu, 10 May 2018 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VU1H007/Wi835ifzaGl/nHDLpJQiG1lbhwTOQC+pzi4=;
        b=ZVMk2lChMaVltkGNFA8koNOPKXPs6j3hCItUsKATUfFXdRCG5sZ2VU8YWdj9DTYBMR
         KwuEvfoLsLlBUtLNru1mTrEyeY17TmnqtTdT0EsSELJ+OPNq1rWTSu6BDaM8a4qmQd27
         aVNzBOhltg+ge5pOiNoWEg6iPaag3iDZhXr+YUNb9MTPg5anobPrD1y5XzcCDhxrGYXo
         aN0ybcAtWsxXaU/vLX7mDHBNcyNsGImN5Y2qsecz0yYxVLpZOWKVp2jxDO8vEkrDxI22
         1pipDL/8XVODojE7xFmwHeeO/c3iRxZE/x+H81maEZ+xdu5h4b4W9a5YjYWkjw1LJl/5
         fwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VU1H007/Wi835ifzaGl/nHDLpJQiG1lbhwTOQC+pzi4=;
        b=aY7sX5n3rctJsn52bO39N5p0RRDJgCpcA5aaMIQJIVLolScobi9HfD+cVT6ROFO/jE
         0B5r+LJD4lMY0yYF6RG+np/e5JOKvOAjIKDEW1tG3UYlc14AzVh0/Z/z8Lbn8egR/eEn
         CWNDB+79VqlgQaVzxRTxk+9y1Tw0Vvf65bq1WKa8gUhS8eMlPZJ0f+BEgCT6m8hAxyPC
         Mhab5sPnd0VSu5oBfzHKV8GTbsYdHaekRj2iBC/OPRvXBXKnqMwOu7LQgB7g+SdSITY3
         8h3xCNptUjM7chH3knv9h/zj3GFFtUE+zfxpop2n3qOpij/keqEfwqHAHJztBkwZ4ejW
         l2nA==
X-Gm-Message-State: ALKqPwc3PxcO8dKrfuC4Rnim8R7v2ArMO8RFsrFlapW3R6K3iQBEMNVZ
        v+OoPV46j3XrhQTHbbmtj7+ujt9r
X-Google-Smtp-Source: AB8JxZo2CW1sdtXkiiFYqxrEBnHrXuIJ6Sg8D98VMZ+fs20Xm6ug36vYyO4mIPgIzKv7tOHvlKqz2g==
X-Received: by 2002:a81:1788:: with SMTP id 130-v6mr1244771ywx.291.1525977620191;
        Thu, 10 May 2018 11:40:20 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::2:a828])
        by smtp.gmail.com with ESMTPSA id c23-v6sm542938ywa.26.2018.05.10.11.40.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 May 2018 11:40:19 -0700 (PDT)
Date:   Thu, 10 May 2018 11:40:18 -0700
From:   Tejun Heo <tj@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [PATCH v2 02/11] docs: admin-guide: add cgroup-v2 documentation
Message-ID: <20180510184018.GS2368884@devbig577.frc2.facebook.com>
References: <cover.1525870886.git.mchehab+samsung@kernel.org>
 <1a62d2ec4d1eef268dd2256a1e2673df994bee5e.1525870886.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a62d2ec4d1eef268dd2256a1e2673df994bee5e.1525870886.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 09, 2018 at 10:18:45AM -0300, Mauro Carvalho Chehab wrote:
> The cgroup-v2.txt is already in ReST format. So, move it to the
> admin-guide, where it belongs.
> 
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Li Zefan <lizefan@huawei.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
