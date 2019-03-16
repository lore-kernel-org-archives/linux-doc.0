Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4F3617D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sat, 16 Mar 2019 08:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfCPIYD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 16 Mar 2019 04:24:03 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40514 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfCPIYB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Mar 2019 04:24:01 -0400
Received: by mail-wm1-f66.google.com with SMTP id u10so5544953wmj.5
        for <linux-doc@vger.kernel.org>; Sat, 16 Mar 2019 01:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=GBN6sTt17ja0CyzD4aSBUx+XTHtWhFsa6WOtp+cR+go=;
        b=RdpZiNd7OBZK3zliemJpBtatIdI8mMR6RTPveTPClemClh2zrihPx5n4YaBAinkLcB
         Ef+cG3htPTHw7qZQTxJeP9T2rwjhgOnrWifnvVwg3yKdLVfwlmpjbFBZvo8zQpjHAGMM
         lRMOyma22TWnjzq2xA5G4cmWVJ1aRu5i2wzXZUc/2/1n9lu4+sn/aB2v8sriJa4Rs4H4
         zccyTyjrGTMjHTTy2e9RHjoFXWjPTobAhpHq8AN0QGKP7/bK7TloxC2TOzqtypkxHLGh
         QhUFVsMqVXX9y/SscMD0xpRRiPb8Hc1MMtb1LRQ8NIGQPseOV+FgddaBe4VkheSZSvKx
         V9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GBN6sTt17ja0CyzD4aSBUx+XTHtWhFsa6WOtp+cR+go=;
        b=hGYVamtFYGRT30bZ6RctX/qhAMU02BihCT/TyHwknYhX0MgEtVSQenPkIGcJuundBD
         U8OxWAzX1hA3ynOH4BnJr8EphbTxOtZyWAH1A2BGplgzeElsO2TO9/X+vihGac6Dxh2v
         eBGIy146RVK4W/WNMYZCguN5AoOmYJbGOCWKZYCzD22AIGWatiVfCrWu8MqSZ1x4pHlp
         wWRda0uY8iYqddMNWKCR99sw89MjZHYn4ifU3Y0N37ZVl85DuziAQtVm3gTnK5dkfKYe
         QtOX/IB1vz2Jvz9rV2EKOoLLyIaEk10/5CMTVk2pQk65X1fA5WqEjHpfF73iq6HxHdgN
         UaMA==
X-Gm-Message-State: APjAAAXVdhNuZIByKxx/iJAWMoTuTKJvM3AQy3tiLSg8Um5pWPoQySE+
        9nhBmJAkpuhhHVuQ37PW/ibnSA==
X-Google-Smtp-Source: APXvYqw95Pgx2zejMXuyQdAzbDfplh1XIoFiJqmmM4Lbc90tzr2Vq4htx8AvJ76GD6v1+yLpmoH8dg==
X-Received: by 2002:a1c:6442:: with SMTP id y63mr5029534wmb.31.1552724638376;
        Sat, 16 Mar 2019 01:23:58 -0700 (PDT)
Received: from linux-2.fritz.box (p200300D993F84200A1D7112AEB672F40.dip0.t-ipconnect.de. [2003:d9:93f8:4200:a1d7:112a:eb67:2f40])
        by smtp.googlemail.com with ESMTPSA id c126sm6591273wma.0.2019.03.16.01.23.56
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Mar 2019 01:23:57 -0700 (PDT)
Subject: Re: [PATCH v2] ipc: Fix race condition in ipc_idr_alloc()
To:     Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Takashi Iwai <tiwai@suse.de>, Davidlohr Bueso <dbueso@suse.de>,
        1vier1@web.de
References: <20190311145335.9634-1-longman@redhat.com>
From:   Manfred Spraul <manfred@colorfullife.com>
Message-ID: <54b37b8a-625e-3aa0-15ab-f2ae179f9dcd@colorfullife.com>
Date:   Sat, 16 Mar 2019 09:23:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190311145335.9634-1-longman@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Waiman,

I hate to write such mail, but what do you try to achieve?
Create code that works with 99.999% probability, to ensure that we have 
undebuggable issues?

On 3/11/19 3:53 PM, Waiman Long wrote:
> In ipc_idr_alloc(), the sequence number of the kern_ipc_perm object
> was updated before calling idr_alloc(). Thus the ipc_checkid() call
> would fail for any previously allocated IPC id.  That gets changed
> recently in order to conserve the sequence number space. That can
> lead to a possible race condition where another thread may have called
> ipc_obtain_object_check() concurrently with a recently deleted IPC id.
> If idr_alloc() function happens to allocate the deleted index value,
> that thread will incorrectly get a handle to the new IPC id.
>
> However, we don't know if we should increment seq before the index value
> is allocated and compared with the previously allocated index value. To
> solve this dilemma, we will always put a new sequence number into the
> kern_ipc_perm object before calling idr_alloc(). If it happens that the
> sequence number don't need to be changed, we write back the right value
> afterward. This will ensure that a concurrent ipc_obtain_object_check()
> will not incorrectly match a deleted IPC id to to a new one.
>
> This is actually no different from what ipc_idr_alloc() used to
> be.

This is plain wrong.

ipc_idr_alloc() was carefully written to ensure that everything is fully 
initialized before the idr_alloc().

The patch breaks that, and instead of fixing it properly, you continue.

>   The new IPC id is no danger of being incorrectly rejected as the
> kern_ipc_perm object will have the right seq value by the time the new
> id is returned.

And?

The whole issue of seq numbers is to prevent accidential collisions.

thread 1 calls semctl(0x1234, IPC_RMID);x = semget().

thread 2 calls semop(0x1234,...).

That everything is corrected before the syscall in thread 1 returns is 
nice - but a meaningless statement.

I've noticed that you initialize new->seq to "seq+1", and then reduce it 
again if there was no wrap-around.

That minimizes the probability, but the code a total mess.


> v2: Update commit log and code comment.
>
> Reported-by: Manfred Spraul <manfred@colorfullife.com>
> Signed-off-by: Waiman Long <longman@redhat.com>

At least Fixes: "[PATCH v12 2/3] ipc: Conserve sequence numbers in 
ipcmni_extend mode" is missing.

Mutch better would be if you retract patches 2 and 3 from your series, 
and do it correctly immediately.

> ---
>   ipc/util.c | 27 ++++++++++++++++++++++++---
>   1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/ipc/util.c b/ipc/util.c
> index 78e14acb51a7..631ed4790c83 100644
> --- a/ipc/util.c
> +++ b/ipc/util.c
> @@ -221,15 +221,36 @@ static inline int ipc_idr_alloc(struct ipc_ids *ids, struct kern_ipc_perm *new)
>   	 */
>   
>   	if (next_id < 0) { /* !CHECKPOINT_RESTORE or next_id is unset */
> +		/*
> +		 * It is possible that another thread may have called
> +		 * ipc_obtain_object_check() concurrently with a recently
> +		 * deleted IPC id (idx|seq). If idr_alloc*() happens to
> +		 * allocate this deleted idx value, the other thread may
> +		 * incorrectly get a handle to the new IPC id.
> +		 *
> +		 * To prevent this race condition from happening, we will
> +		 * always store a new sequence number into the kern_ipc_perm
> +		 * object before calling idr_alloc*(). This is what
> +		 * ipc_idr_alloc() used to behave.

I would avoid to describe history in the comments:

 From my understanding, the comments should describe the current situation.

History belongs into the commit description.

>   If we find out that we
> +		 * don't need to change seq, we write back the right value
> +		 * to the kern_ipc_perm object before returning the new
> +		 * IPC id to userspace.
> +		 */
> +		new->seq = ids->seq + 1;
> +		if (new->seq > IPCID_SEQ_MAX)
> +			new->seq = 0;
> +
>   		if (ipc_mni_extended)
>   			idx = idr_alloc_cyclic(&ids->ipcs_idr, new, 0, ipc_mni,
>   						GFP_NOWAIT);
>   		else
>   			idx = idr_alloc(&ids->ipcs_idr, new, 0, 0, GFP_NOWAIT);
>   
> -		if ((idx <= ids->last_idx) && (++ids->seq > IPCID_SEQ_MAX))
> -			ids->seq = 0;
> -		new->seq = ids->seq;
> +		/* Make ids->seq and new->seq stay in sync */
> +		if (idx <= ids->last_idx)
> +			ids->seq = new->seq;
> +		else
> +			new->seq = ids->seq;

For this line, a big comment would be required:

new->seq is now written after idr_alloc().

This is the opposite of what is written in the comments on top of 
ipc_idr_alloc().

So if the patch is applied, the code would contradict the comments -> 
total mess.


@Andrew: From my point of view, patches 2 and 3 from the series are not 
ready for merging.

I would propose to drop them.

--

     Manfred

