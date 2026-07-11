Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383772DB7BE
	for <linux-doc@vger.kernel.org>; Sat, 11 Jul 2026 03:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783739364; cv=none; b=bW0Wd/KVa6cGQ4KibK8U/9INipHdemDcJ/B3YRhrQeW7aSUD4tlUCP0sNCeuWdjG1pBv2g6gQWTXL0iv1j1usBfzP41h5psCoFYmJdZlVnkk5yPzluksw00Q6aW8i9v3I1/akfU2yl35g43bLjMIir33QnJjTfcS341lJ2qbXUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783739364; c=relaxed/simple;
	bh=Talh9NFQCx452XKRUTeh7mUAoB/ijgfuASG+mTSXc/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYsSSdz5xlVPN78NlOVasOqqkz0tRA9wpMEEhRqNHftz7Iji/DHPgEpMDL+brcx/hoNQxPL/IW0jc/ptIWu4OTNee5jfpREpUYp/OFFCsfH8e6+VJXbI8BgiRi7ly39zBYrC4dil9irwYnrPqWmcpaB0nHQhRDNvXRv6P2bblms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3qaXtGK; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3qaXtGK"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca88130e09aso1018201a12.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 20:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783739362; x=1784344162; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBT/pxhbpviyB1eK4ppjTwsrTkYiVk3Lhi/aEEh6q5s=;
        b=D3qaXtGKb2Xf/9+wr2HRFKL8jmCpHoxmOjnzBKRHFG4bHHCEScpCbA5LpnhM2eS11X
         nG9M0kPvxBXep+/0ZCyYpRgX9l/ZOilK8nOM71Vgq6QSmbYjtBkKLSTeFdNymLrs/NtM
         lHJqYdTRaEwaAkny4yNm2SHBIWlKx0LsU1YAI8HL2f/iW6YlZOXXXaHQBlQD9xfTOEEf
         qaGDiV+BqsVGAnDAlYreU+5w03vSy3s7iByMkQO+PHscZvMeT1dJQUSue75LORCHtvZb
         OMKMnwjruN3UimS/yQ0MnbqQtL/WsXfSgGLdVFnix7IQ8JsllW63eDEk3VrejGY7F/03
         vdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783739362; x=1784344162;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KBT/pxhbpviyB1eK4ppjTwsrTkYiVk3Lhi/aEEh6q5s=;
        b=OfuG06XeexjjzfFN9oqnxhuCIYP1Lpf1fTm9xi+exJ8KvXvgImvhMJC0BGXZc0MrwO
         BpnwqqgA+OqgAENWeKrNv+OIHDkO16T2Axaw8y+6V55xclj44ivdgsOQBp4n3XaxSowC
         akAagBsQjsYJCZUXQJKjO9yO3UnRZYQiXjwf2OKVJE9B53EyDnFEw5ev97pXB1zC7P7F
         k57ghzfWusH+zte4BCKeK1OHB1/EbMI4omTdAMGQmhrsoB56ZluJYZLUm2rN0nEFJk3v
         W5BcTXJgFiDQACAwYsXrAFwA10AI4Cmux58rVZhgGo3nSEpY+O13yqHUHyoLCD/QJiNE
         krKg==
X-Forwarded-Encrypted: i=1; AHgh+RplBZ69fe7KFytd1w8xdpqktoJEn22FcqKmAXzS2QMxQYsMliOm4VlnKFhq5EWwWQ7V4ocIa/bxZAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiCC4JhZvIkIJtIspqfl29wAHMrRyo9BpiThVz3DsV7bvcsjNe
	yBSpqUpCfRBJ34sylj5SR7lSNiFTh9nuEiOd5VkDmFCFOXXvcjhl0J+4
X-Gm-Gg: AfdE7cnjNZnXDPJhhIQG+WsFGw01brxxMJCngd22xYBqzCMg7CeXAsbBcH+MxyzJdpA
	Yw3kFm+R/hFFlkMBSBbIrg9EDZBJ+t+9PasAwwNNKMasL1yP1/VmtHpeWkP/t8Pt8GtUmt21d4A
	niNCzkx8HgekO0XDLTzN/5WY39ArINO5W2XFxsya6KgCAj+4rJHjb8teD2+km9/GNc1Pw7VsVm4
	745ODW6rmvmRk2oEy/c/YrNQH4w5OeG9hqueb3MqBcQSFAUjgcfSe4zlKX9G5UdC12ftAJlkUjh
	so2YslIPuttQvgdoQKi3L4u6ca5yAb0lW4IK9JHVORIruJy/U+w6JhWP8Rp4mCR483MGien4vFI
	ltc1X1lN8m9fqlGKFY7wCY7RMiLeV5ufWSdPNyqN35kWQTUZiuHqmFEPCSHl/8x0exMtHihApNp
	eFp/gCMkRi2mNrpWVf/oDTPeNM3uitnRPBAXClv459P27qFmXze0Zm/qM=
X-Received: by 2002:a05:6a00:3404:b0:847:9151:3409 with SMTP id d2e1a72fcca58-84889797ad5mr1318139b3a.55.1783739362452;
        Fri, 10 Jul 2026 20:09:22 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm11140358b3a.53.2026.07.10.20.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:09:21 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:09:18 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, corbet@lwn.net,
	dakr@kernel.org, david@kernel.org, decui@microsoft.com,
	haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v8 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <alGz3vywc6W5hvso@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371879503.900500.7148019929226548795.stgit@skinsburskii>
 <20260710151209.157d7c80b03dc56d73b5884a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710151209.157d7c80b03dc56d73b5884a@linux-foundation.org>

On Fri, Jul 10, 2026 at 03:12:09PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 14:26:35 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > hmm_range_fault() requires the caller to hold the mmap read lock for the
> > duration of the call. This is incompatible with mappings whose fault
> > handler may release the mmap lock, notably userfaultfd-managed regions,
> > where handle_mm_fault() can return VM_FAULT_RETRY or VM_FAULT_COMPLETED
> > after dropping the lock. Drivers that need to populate device page tables
> > for such mappings have no way to do so today.
> > 
> > Add hmm_range_fault_unlocked_timeout() for callers that do not need to hold
> > mmap_lock across any work outside the HMM fault itself. The helper takes
> > mmap_read_lock_killable() internally, calls the common HMM fault
> > implementation, and releases the lock before returning if it is still held.
> > The timeout is specified in jiffies; passing 0 retries indefinitely, while
> > a non-zero timeout makes the helper return -EBUSY when the retry budget
> > expires.
> > 
> > When handle_mm_fault() drops mmap_lock, or when the range is invalidated,
> > hmm_range_fault_unlocked_timeout() refreshes range->notifier_seq and
> > retries the walk internally. If the lock was dropped, the retry deadline is
> > also restarted because a lock-dropping fault handler made progress.
> > Ordinary -EBUSY retries keep the existing deadline, preserving the caller's
> > timeout policy for repeated mmu-notifier invalidations.
> > 
> > The caller only needs to perform the usual post-success
> > mmu_interval_read_retry() check while holding its update lock before
> > consuming the pfns. If mmap_lock acquisition is interrupted or a fatal
> > signal is pending during retry handling, -EINTR is returned instead.
> > 
> > The common implementation conditionally sets FAULT_FLAG_ALLOW_RETRY and
> > FAULT_FLAG_KILLABLE only for hmm_range_fault_unlocked_timeout(). The
> > existing hmm_range_fault() path still passes no locked state, does not
> > allow handle_mm_fault() to drop mmap_lock, and remains a thin wrapper
> > preserving the existing API contract for current callers.
> > 
> > The previous refactor that moved page fault handling out of the page-table
> > walk callbacks is what makes this change small. Faults now run after
> > walk_page_range() has unwound, with only mmap_lock held, so dropping it
> > does not interact with the walker's pte spinlock or hugetlb_vma_lock.
> > Hugetlb regions therefore participate in the unlocked path uniformly with
> > PTE- and PMD-level mappings; no special case is required.
> > 
> > Documentation/mm/hmm.rst is updated with a description of the new API and
> > the recommended caller pattern.
> > 
> > ...
> >
> 
> A trivial thing:
> 
> > +int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
> > +				     unsigned long timeout)
> > +{
> > +	struct mm_struct *mm = range->notifier->mm;
> > +	unsigned long deadline = 0;
> > +	bool locked = false;
> 
> This could be local to the do loop and it needn't be initialized.
> 

Unfortunately, it can’t, because its state is mutated in
hmm_range_fault_locked() and the resulting state needs to be preserved
across iterations of the loop as deadline reset depends on it.

Thanks,
Stanislav

> > +	int ret;
> > +
> > +	do {
> > +		if (fatal_signal_pending(current))
> > +			return -EINTR;
> > +
> > +		if (timeout) {
> > +			/*
> > +			 * If the previous fault dropped mmap_lock, then the fault
> > +			 * handler made progress. Restart the retry timeout in that
> > +			 * case, but keep the existing deadline for ordinary -EBUSY
> > +			 * retries.
> > +			 */
> > +			if (!locked)
> > +				deadline = jiffies + timeout;
> > +
> > +			if (time_after(jiffies, deadline))
> > +				return -EBUSY;
> > +		}
> > +
> > +		range->notifier_seq =
> > +			mmu_interval_read_begin(range->notifier);
> > +
> > +		ret = mmap_read_lock_killable(mm);
> > +		if (ret)
> > +			return ret;
> > +
> > +		locked = true;
> > +		ret = hmm_range_fault_locked(range, &locked);
> > +		if (locked)
> > +			mmap_read_unlock(mm);
> > +	} while (ret == -EBUSY);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(hmm_range_fault_unlocked_timeout);
> > +
> 
