Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69EC426D0B
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379626; cv=pass; b=Fk+nNoNYaRIlF9o5kXJRI9s5MhZWZVnRkKVsXmp1JWnsBDBGI/qIYNMBhfW+a1Vzlm05mHo0ZOnfce4siisnZ4fzsCbuWiWQPtKq0d+Raw+MKq81EO9miRXpMHjnACN2T0U3fq2TP7pO9cCpKIU5posa6GgX8Try6SfCb+Vvyac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379626; c=relaxed/simple;
	bh=92IdV19r0TDh/ZZaldtV1bjlAmTbuJX6DPtxnWcUDvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NrTg7z/wqCniXy9Now2vxFIJdN5xZl21RQaZ5Zw0O1Dj6exNEQUXPCvk+yNrYL4uE+nkn6MU3Tl3D1dCmgu2mKWIA5demMG0WrVwajTQblxvlxWvz7JCXI1XLRDAn+a09XEI3KgZMzR2yHCEkWZrn/NRTCU6kFcaEfrp2bUkadQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8nkiV09; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8nkiV09"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2183410f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 09:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786379623; cv=none;
        d=google.com; s=arc-20260327;
        b=qjqA/D1aHWkIraQ4RT4UU0zLXW2HutEEh+Iauzw2C/QZ1k+hkkOAwKbcEnjHqlDJ9q
         oeWxZLUNnwH2JlsDXdLYZ87dpbl+VRDtSjZljWFdkVuziGvr8VKk5dg/mFlUBXztm3NK
         CFtnZ3osw8OeSMxInFV3kBqwx0TemQVODhc1PvKXRZDh0E0fbtXs5PsWgR43D4Z07hnl
         VycLkSxq6KuXh7p11a0enmM4HaQKpNJoqzEhkSu7qxWmsRATATQWCiPRYQMAUmRwETny
         JVzpgGdH5g0vuo1mZrvZoDAOaW0rmF2GImYUIcvYEJy7cGtQdLoG+pCCc38k6pDCpLqL
         8VzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=92IdV19r0TDh/ZZaldtV1bjlAmTbuJX6DPtxnWcUDvU=;
        fh=GNlmhdW/lrgvGefREKYJw0cL075FDoEff4SGblE2vTE=;
        b=emzeo+mQYVc8hsRxaf+15Tbp2qu3MENrmCC1PZGNAHWAnXVn6QrR64pPU851pTkFMG
         6wFnT3hwkYXW+3tPRdEHTBGTDR1ei1lRtByLqXioEioAASzORZ1RJq9OVVNIt8Jz63o8
         9me74qedcd4VIaXi0TiOEZbagbXb0CkhoLV9i7Z1zBF7maa6jgFMU+/mfVOt3wLXf5WR
         PM+oFcqfM+I7jNMYDZpWlT8PPNGJwcIK1t83DgiMIrXqVqJQbxzwgdAsGsCjXZN5oKjR
         Bvzq+7D93rROaJbfENBuj8kvZUgB4UXw/P2a6tY7/lusXVnAeEZp3rORwEh1TaQydMkX
         YhuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786379623; x=1786984423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=92IdV19r0TDh/ZZaldtV1bjlAmTbuJX6DPtxnWcUDvU=;
        b=A8nkiV09mUMVaZGn1g6ZmAv/VBnKw+90bPl8eOV5UL0+5cLisIR16/CTIvY4uWRWKg
         k46P1Up/l3E2F+v1Af2QpJ1dtIVaCUdyCVMaP8N+jDyC4r+/1jjBLgGWGWfr2PiyTlpo
         yO8SQ1oGEI4zJ/AHG7tAtraUmjG33aBFPsZxw7mxUckVT4jV0M5OhgZsmKn3phguqK2q
         vT7jmyO2YajscjBl09EaXZ68Fv5JK14077LWaLVnlvR/7hhNTzPu5XuoHakWVFsr6658
         mS2DB621jYV+H945yn7UXEcLVEWHh7S9wLrAbZSz/uGkaOuihfDehLaLuGMqcOAhhohl
         RbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379623; x=1786984423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92IdV19r0TDh/ZZaldtV1bjlAmTbuJX6DPtxnWcUDvU=;
        b=nZe4ceQ54Kr8B1kzoKg4UjXrnBYCJJWJZ4cghWOeOhfrfrHUnK5JHIpZ7MbvahbSA/
         IIwVTMp6mT37gMOlYjReTXUiHCpk1p+Ko8clr2HtFen8Ky6ulX3FBZHhyLJ8Cc3CZn8u
         oCNJLkawf3/YTb9yy7C9WkeiGDvzD9Hla5iWjHnMEeJ73j2e407l1nmU3dFL5HM47snO
         CDn5uENo29yJdwldCmQFUzdpWAC02cjADFgbQTQN1S9/CrpynyKjLVnewIFxCcwJrzFa
         vNnaVFSRLzxtRkIa7lhZae3++JRM3g8pC7H2zUPPQIqFBAnGVkxIn+tkxFsrHLO9idYc
         VADg==
X-Forwarded-Encrypted: i=1; AHgh+Rra092tRnsu/jObyPMcMWSBSdfIXFRHf7X1aRxbAkaZiis/JNFZcLhkncjU+W+cwwY1HcXR3z030Dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUOYa4zczNttOYpeaq10uK8iUFTixI22Tp7O+Wqdgw/jvl4Nhj
	BOn28OwqR/3hTli4Bgk+yj721xORQY0AX6mPV9sKibgodGF6aYiyTEe9cGGvqIOjcF0unkPz80V
	uxH1J1P/KZFmLLxeQ3rtkMl2EluWg+8U=
X-Gm-Gg: AR+sD1001xyKi0UgEG0Nb7i+z5DzURvkaMPxMPX76pzecIvtwkD8IyVh411xhSl5Q94
	xk8XVaFCBenM/Vu8f5GwiBKXs4HvX8lOwSl13F1eZm7xpXMuq6T7GkB3hfQ9+95YWx91iQUCT6z
	0PfkMrZci7k5ojk1WNLvibEK3pW3jQdzyXzXfjK8rWHnzcd3PyopF2+z1kJRH2z84DNVwiyJD0I
	ITlN0CyejWJH/8JnUJ1di6rQhLCJFXLyl7KQJL6/pvTkQXHTnRnP45Wlk9e7EzTNPiestvAB9VS
	WeWTY+syEEu4UKSrjHgobwBz9QXGbIFlDbzZKN9rfu8BZQ921zaQeoNqAtFgTb4krZwG0+1Lxz4
	bCFUgQvSQTbjB
X-Received: by 2002:a05:6000:c50:b0:47f:7c50:2222 with SMTP id
 ffacd0b85a97d-47ffd967728mr37586913f8f.24.1786379622849; Mon, 10 Aug 2026
 09:33:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806184254.3790858-1-nphamcs@gmail.com> <6a756c71.01d0871a.3a0d52.003a.GAE@google.com>
 <CACePvbVKpkyV7KpUoiYPTUN0MgEcRUzZL71qTL5ePyjHTA3Kbg@mail.gmail.com>
In-Reply-To: <CACePvbVKpkyV7KpUoiYPTUN0MgEcRUzZL71qTL5ePyjHTA3Kbg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 10 Aug 2026 09:33:31 -0700
X-Gm-Features: AUfX_mzZKBGWa5jQHBx4faGYg8WQuFE8t_gvjrXgkg0wPeZavX_nvUNwRzCJVmE
Message-ID: <CAKEwX=M=08W43G3dSjRh1p7Z0QFSDQZWuNWguon1yETvxW+89A@mail.gmail.com>
Subject: Re: [syzbot ci] Re: Virtual Swap Space (Swap Table Edition)
To: Chris Li <chrisl@kernel.org>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, baohua@kernel.org, 
	baoquan.he@linux.dev, cgroups@vger.kernel.org, chengming.zhou@linux.dev, 
	corbet@lwn.net, david@kernel.org, gourry@gourry.net, hannes@cmpxchg.org, 
	haowenchao22@gmail.com, kasong@tencent.com, kernel-team@meta.com, 
	liam@infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, mhocko@kernel.org, muchun.song@linux.dev, 
	qi.zheng@linux.dev, riel@surriel.com, roman.gushchin@linux.dev, 
	rppt@kernel.org, shakeel.butt@linux.dev, shikemeng@huaweicloud.com, 
	surenb@google.com, vbabka@kernel.org, weixugc@google.com, yosry@kernel.org, 
	youngjun.park@lge.com, yuanchu@google.com, syzbot@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 12:21=E2=80=AFAM Chris Li <chrisl@kernel.org> wrote:
>
> Hi Nhat,
>
> On Thu, Aug 6, 2026 at 10:26=E2=80=AFPM syzbot ci
> <syzbot+cif942a042aaa8793c@syzkaller.appspotmail.com> wrote:
> >
> > syzbot ci has tested the following series
> >
> > [v3] Virtual Swap Space (Swap Table Edition)
> > https://lore.kernel.org/all/20260806184254.3790858-1-nphamcs@gmail.com
> > * [PATCH v3 01/11] mm, swap: add virtual swap device infrastructure
> > * [PATCH v3 02/11] mm, swap: support zswap and zeroswap as vswap backen=
ds
> > * [PATCH v3 03/11] mm, swap: prepare the swap IO path for vswap
> > * [PATCH v3 04/11] mm, swap: support physical swap as a vswap backend
> > * [PATCH v3 05/11] mm, swap: enable THP swapin for vswap entries
> > * [PATCH v3 06/11] mm, swap: write back vswap zswap entries to physical=
 swap
> > * [PATCH v3 07/11] mm, swap: reclaim physical slots backing cache-only =
vswap entries
> > * [PATCH v3 08/11] mm, swap: only charge physical swap entries
> > * [PATCH v3 09/11] mm, swap: add debugfs counters for vswap
> > * [PATCH v3 10/11] mm, swap: defer memcg_table allocation for physical =
swap clusters
> > * [PATCH v3 11/11] mm, swap: widen swap_info_struct max/pages to unsign=
ed long
> >
> > and found the following issue:
> > KASAN: null-ptr-deref Read in swap_entry_backend_has_flag
> >
> > Full report is available here:
> > https://ci.syzbot.org/series/e7da1097-3230-4e50-80cb-1dfafeebea40
>
> Please take a look at the syzbot report and let us know what you think.
>
> Chris
>

Oh it's a real bug. Not too hard to fix though.

Basically, before adding the folio to the swap cache, all bets are
off. If you don't lock the PTE ("and pte mapped but not yet locked"),
the swap entry can even go away under you. With the old code and no
indirection, it's fine - we pin the swap device, and we only need that
swap device's property here (for the sync IO dispatch). With vswap
though, you need to also check vswap's entry backend device. I need to
add proper rcu/null check here in the case the vswap entry (and its
cluster) goes away.

Ironically, I think I got this correct in the pre-swap-table version
:) I was way, way overly defensive over there (I think I add one extra
pin for the vswap entry, and then pin the backend device to just for
good measures, which is not really necessary).
