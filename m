Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A55707D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Nov 2018 19:42:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbeKUGMx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Nov 2018 01:12:53 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46273 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727164AbeKUGMt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Nov 2018 01:12:49 -0500
Received: by mail-wr1-f67.google.com with SMTP id l9so3212643wrt.13
        for <linux-doc@vger.kernel.org>; Tue, 20 Nov 2018 11:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=7hQeTzEhhj6vJTILIj46tFWSIB1R/dqUxqL4qWzyzLE=;
        b=1zflwJf0Xm3ILxWpVLZJSoWw5n2luyINra4H2ncsoo2Lw0lULBzTJvZq/g+IU2prnG
         OJGvexQ8atO/wRhu4Bw7bXhe7hvoyVaR1Yjc2bISjzhKtoTyP3q50ZqivUmiEQz+8KyX
         3PFYDkBKmDU5aGcc5nu14ALeH5tzSbLLCrW2+7VbEJmMJxNUFp9VccYLZI1+9etZU4QB
         IIMPuTE5bWx4mbiKdktYUgI3K0EYLQnPoiEjDumCO9fmKouuTG8WWoQbQQ7pmvDHkWsg
         4V3OfBF9nIPdbT16nHDChTzXSwFUF1gDvsk7ObPYeAHHpns1O4t3EysrsiLheKOlmDTX
         VEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=7hQeTzEhhj6vJTILIj46tFWSIB1R/dqUxqL4qWzyzLE=;
        b=Ml3cLqrbzAjZ8x3IVv1LS/5dfps+trS3D+WcbCO7N1OpRefcj/OubHFmouN57YMIr0
         /6zlksqZsXonVCLXe8u85Q+LgQEDpEqJpOd1sXb0647XyB6vWDzJULweqJkjSSi5YH9b
         cP717gBUwtV7u6EqI3ESILjmEtuMglvfUg8+MsprKnz4VXgEOfjTTLgiNiZ9LJ2F20SP
         jNBx7eEkrE2e4yXtY53yzcF+6F+21lvYOMm+0Lt61gdMvm0BxMrfWQ5n9gP5EBcHoQ8z
         YhoVt2GWsm61o9RuZdKaf8s0ROyNqiTMY7bGrp9pVLDMIf3plapAKZ7eehdU0jJ3qAm6
         9u+w==
X-Gm-Message-State: AA+aEWb4tazbWA4h005tV3FlNArVqKNxTuGu2IVj1WXSars5LRmz5zMa
        yJXQX76bmqKNRxPceuEMutMjgQ==
X-Google-Smtp-Source: AFSGD/VxeQ2/rnkoj1l/q5yCao3H2aQ4Nt0V38v5mMLVPGFjO3r/2UkrN4pseuvXRgzuZBYbtXuA9Q==
X-Received: by 2002:a5d:6648:: with SMTP id f8mr3300446wrw.117.1542742919767;
        Tue, 20 Nov 2018 11:41:59 -0800 (PST)
Received: from linux.fritz.box (p200300D993C74C00FC5A0EA9BDDF9934.dip0.t-ipconnect.de. [2003:d9:93c7:4c00:fc5a:ea9:bddf:9934])
        by smtp.googlemail.com with ESMTPSA id l24sm12080641wme.32.2018.11.20.11.41.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Nov 2018 11:41:58 -0800 (PST)
Subject: Re: [PATCH v11 2/3] ipc: Conserve sequence numbers in ipcmni_extend
 mode
To:     Matthew Wilcox <willy@infradead.org>,
        Waiman Long <longman@redhat.com>
Cc:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Takashi Iwai <tiwai@suse.de>, Davidlohr Bueso <dbueso@suse.de>
References: <1541794292-19425-1-git-send-email-longman@redhat.com>
 <1541794292-19425-3-git-send-email-longman@redhat.com>
 <20181110074125.GB21824@bombadil.infradead.org>
From:   Manfred Spraul <manfred@colorfullife.com>
Message-ID: <c589992a-0c7e-ecf2-9544-3c82dfb96f9f@colorfullife.com>
Date:   Tue, 20 Nov 2018 20:41:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181110074125.GB21824@bombadil.infradead.org>
Content-Type: multipart/mixed;
 boundary="------------6C63EC410272F8E0E54722AB"
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is a multi-part message in MIME format.
--------------6C63EC410272F8E0E54722AB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Matthew,

On 11/10/18 8:41 AM, Matthew Wilcox wrote:
> On Fri, Nov 09, 2018 at 03:11:31PM -0500, Waiman Long wrote:
>> The mixing in of a sequence number into the IPC IDs is probably to
>> avoid ID reuse in userspace as much as possible. With ipcmni_extend
>> mode, the number of usable sequence numbers is greatly reduced leading
>> to higher chance of ID reuse.
>>
>> To address this issue, we need to conserve the sequence number space
>> as much as possible. Right now, the sequence number is incremented
>> for every new ID created. In reality, we only need to increment the
>> sequence number when one or more IDs have been removed previously to
>> make sure that those IDs will not be reused when a new one is built.
>> This is being done irrespective of the ipcmni mode.
> That's not what I said.  Increment the sequence ID when the cursor wraps,
> not when there's been a deletion.

Something like the attached patch?

Unfortunately, idr_alloc_cyclic cannot be used, this creates some 
copy&paste from lib/idr.c to ipc/util.c
[as potential replacement for patch 2 and 3 from the series]

--

     Manfred


--------------6C63EC410272F8E0E54722AB
Content-Type: text/x-patch;
 name="0002-ipc-util.c-use-idr_alloc_cyclic-for-ipc-allocations.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-ipc-util.c-use-idr_alloc_cyclic-for-ipc-allocations.pat";
 filename*1="ch"

From 6bbade73d21884258a995698f21ad3128df8e98a Mon Sep 17 00:00:00 2001
From: Manfred Spraul <manfred@colorfullife.com>
Date: Sat, 29 Sep 2018 15:43:28 +0200
Subject: [PATCH 2/2] ipc/util.c: use idr_alloc_cyclic() for ipc allocations

A bit related to the patch that increases IPC_MNI, and
partially based on the mail from willy@infradead.org:

(User space) id reuse create the risk of data corruption:

Process A: calls ipc function
Process A: sleeps just at the beginning of the syscall
Process B: Frees the ipc object (i.e.: calls ...ctl(IPC_RMID)
Process B: Creates a new ipc object (i.e.: calls ...get())
	<If new object and old object have the same id>
Process A: is woken up, and accesses the new object

To reduce the probability that the new and the old object have the
same id, the current implementation adds a sequence number to the
index of the object in the idr tree.

To further reduce the probability for a reuse, perform a cyclic
allocation, and increase the sequence number only when there is
a wrap-around. Unfortunately, idr_alloc_cyclic cannot be used,
because the sequence number must be increased when a wrap-around
occurs.

The patch cycles over at least RADIX_TREE_MAP_SIZE, i.e.
if there is only a small number of objects, the accesses
continue to be direct.

Signed-off-by: Manfred Spraul <manfred@colorfullife.com>
---
 ipc/util.c | 48 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/ipc/util.c b/ipc/util.c
index 07ae117ccdc0..fa7b8fa7a14c 100644
--- a/ipc/util.c
+++ b/ipc/util.c
@@ -216,10 +216,49 @@ static inline int ipc_idr_alloc(struct ipc_ids *ids, struct kern_ipc_perm *new)
 	 */
 
 	if (next_id < 0) { /* !CHECKPOINT_RESTORE or next_id is unset */
-		new->seq = ids->seq++;
-		if (ids->seq > IPCID_SEQ_MAX)
-			ids->seq = 0;
-		idx = idr_alloc(&ids->ipcs_idr, new, 0, 0, GFP_NOWAIT);
+		int idx_max;
+
+		/*
+		 * If a user space visible id is reused, then this creates a
+		 * risk for data corruption. To reduce the probability that
+		 * a number is reused, three approaches are used:
+		 * 1) the idr index is allocated cyclically.
+		 * 2) the use space id is build by concatenating the
+		 *    internal idr index with a sequence number.
+		 * 3) The sequence number is only increased when the index
+		 *    wraps around.
+		 * Note that this code cannot use idr_alloc_cyclic:
+		 * new->seq must be set before the entry is inserted in the
+		 * idr.
+		 */
+		idx_max = ids->in_use*2;
+		if (idx_max < RADIX_TREE_MAP_SIZE)
+			idx_max = RADIX_TREE_MAP_SIZE;
+		if (idx_max > ipc_mni)
+			idx_max = ipc_mni;
+
+		if (ids->ipcs_idr.idr_next <= idx_max) {
+			new->seq = ids->seq;
+			idx = idr_alloc(&ids->ipcs_idr, new,
+						ids->ipcs_idr.idr_next,
+						idx_max, GFP_NOWAIT);
+		}
+
+		if ((idx == -ENOSPC) && (ids->ipcs_idr.idr_next > 0)) {
+			/*
+			 * A wrap around occurred.
+			 * Increase ids->seq, update new->seq
+			 */
+			ids->seq++;
+			if (ids->seq > IPCID_SEQ_MAX)
+				ids->seq = 0;
+			new->seq = ids->seq;
+
+			idx = idr_alloc(&ids->ipcs_idr, new, 0, idx_max,
+						GFP_NOWAIT);
+		}
+		if (idx >= 0)
+			ids->ipcs_idr.idr_next = idx+1;
 	} else {
 		new->seq = ipcid_to_seqx(next_id);
 		idx = idr_alloc(&ids->ipcs_idr, new, ipcid_to_idx(next_id),
@@ -227,6 +266,7 @@ static inline int ipc_idr_alloc(struct ipc_ids *ids, struct kern_ipc_perm *new)
 	}
 	if (idx >= 0)
 		new->id = (new->seq << IPCMNI_SEQ_SHIFT) + idx;
+
 	return idx;
 }
 
-- 
2.17.2


--------------6C63EC410272F8E0E54722AB--
