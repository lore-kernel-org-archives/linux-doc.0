Return-Path: <SRS0=MCi+=BN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CACAC433E3
	for <linux-doc@archiver.kernel.org>; Mon,  3 Aug 2020 18:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 031C2207DF
	for <linux-doc@archiver.kernel.org>; Mon,  3 Aug 2020 18:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AJgTtJOf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbgHCS1D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Aug 2020 14:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728664AbgHCS1B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Aug 2020 14:27:01 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4971C061757
        for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2020 11:27:00 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id 1so15080679vsl.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2020 11:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kP+FsGwT7Ong6g9Z4afLp/eWEQkLU5G56u7wCNQ8PbY=;
        b=AJgTtJOfq33QtwVrHYsaLOFspsbTiqgCrzwxWUY4KSq8nn719n+LK296FDkKFWb8T/
         zvbXOvclUTRqLQF7WTykx9gCeghXvWxet31NMy9+UG+NrC+4/FTyOer5i1CmCmMo0PV1
         yVvi/nIBZZJzUWIh9DtK+klhMtAxhPJ/ulejuNnLSgm60MrsJ2Q90/Typ5lUScJ085mD
         jNUdQOdm/4sVykvl/EH4WQG63v+mYA/ZS0d7HyrbkkRQjRXYZewhg6AiAQGcJcvP7FiZ
         olFj/Vgfz+QhA0pdRP+9yyIHjYV4J8WcoUK+EPB37dwI4LCLmCkX5KRmdpei3BwBnw5p
         +4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kP+FsGwT7Ong6g9Z4afLp/eWEQkLU5G56u7wCNQ8PbY=;
        b=cprs65wqFVkz0Zs5OU3Jkczo58pQ+ON54GaDGwy+tsSEhZ0HZCiZf1YzuIiRWcvZrB
         sh+rJ7KIiSI3jAATtJNHcRu3ty0WquxuCzNuFDE23nwTAb5Ss7co2JyQ1HY7gSEjo145
         2zLmj4KFZfkj6utWGV6rTjOPALGx4jP7XFt9GZRpNIyxgP23PKOnpIP3jYLU2xrAtDUB
         V4Lr+UUBoqJNe231/3oGMmX/16GmSG9vhM1XWxTJ1kcA+vW85+oEL9kg8jZgHAGMHSo2
         VvCL2jPySAj4/oHvcuiCqRVo90MyUR5T+R3gkIn2ZiNDU65Id7RJ/K8mRtPcJ/FMJWhg
         04oA==
X-Gm-Message-State: AOAM533qIRp3gaUC8SiloTLr3fwjX35v1YgyGqNwlyF3Mgvqc0wV7pSm
        HT6DJjssr93XbSVw4+OTKe9tEi4OggFXJw==
X-Google-Smtp-Source: ABdhPJyU6H1ORSnyrbL6pgwSK5k0t4nkRLWrE1WiAHAQSrIO/HfrXXNuBwmpKt88ZgedOp1BLgmXJw==
X-Received: by 2002:a67:8084:: with SMTP id b126mr12585151vsd.163.1596479219744;
        Mon, 03 Aug 2020 11:26:59 -0700 (PDT)
Received: from google.com (182.71.196.35.bc.googleusercontent.com. [35.196.71.182])
        by smtp.gmail.com with ESMTPSA id o3sm1766447vka.42.2020.08.03.11.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 11:26:59 -0700 (PDT)
Date:   Mon, 3 Aug 2020 18:26:56 +0000
From:   Kalesh Singh <kaleshsingh@google.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-fsdevel@vger.kernel.org,
        Suren Baghdasaryan <surenb@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Ioannis Ilkos <ilkos@google.com>,
        John Stultz <john.stultz@linaro.org>, kernel-team@android.com
Subject: Re: [PATCH 1/2] fs: Add fd_install file operation
Message-ID: <20200803182656.GA3230172@google.com>
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-2-kaleshsingh@google.com>
 <20200803163429.GA15200@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200803163429.GA15200@infradead.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 03, 2020 at 05:34:29PM +0100, Christoph Hellwig wrote:
> On Mon, Aug 03, 2020 at 02:47:18PM +0000, Kalesh Singh wrote:
> > Provides a per process hook for the acquisition of file descriptors,
> > despite the method used to obtain the descriptor.
> > 
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> 
> I strongly disagree with this.  The file operation has no business
> hooking into installing the fd.
Hi Christoph. I am exploring the alternative suggested by Matthew in
Patch 2/2. Thanks :)
