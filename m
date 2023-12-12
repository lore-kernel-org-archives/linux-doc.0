Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720C264CEB
	for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 23:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlJ6vIEL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0570AC433CA
	for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 23:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702424406;
	bh=zXHQF7Ay6V2DwGSP7PW43cHZ4MHQlH5fsUBGMwcWepg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mlJ6vIEL907Id3r0ZRlAzIlJLsmxIue/J0/U1PTry/966Ffk2IoD4AhVEEKDC21zM
	 1o6aEl1oSGIEwIAekJJ8LMsj40t5T4WZghjUT3vj+frKNt4dD5oIDy/300+vWyg4Mi
	 IDxrN76NFMXCP/OoMsCVg7PLM2z/2LIal3EfsXAbV5klFS4M4CLCdBgOm/Bw22/8f0
	 sVxX68RF9VsUELRcKhDpepB/j4ZByk9DebWcYk7bdlTaFkIODMSjqAfJJkwsL0yzIL
	 xF1Gxc47pJiBqsncUvTE0AO3u5h3L+20Cg4WOXgDYUPdPO3PXMoIP685o+YRHbQopQ
	 CTjhrq6pB1PSw==
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso5218842a12.3
        for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 15:40:06 -0800 (PST)
X-Gm-Message-State: AOJu0YwnCD774goBFI5cq5Ewvr5QTRtMkM+5Wg2z+3gVvLlpllEzG/6b
	mDEuxL+O7zLHYnTg5Tekidin4a9V32pdA73cjGxhVQ==
X-Google-Smtp-Source: AGHT+IEmqfa4ep60xPurty5z6OFDCdyneMw1aoInldpxnnUT16j6Ovr9QuBYq9vrMR1uZBLj+lHa8r4Xxm1cJx1AwG0=
X-Received: by 2002:a17:90a:510f:b0:28a:d858:b6ba with SMTP id
 t15-20020a17090a510f00b0028ad858b6bamr673250pjh.42.1702424385003; Tue, 12 Dec
 2023 15:39:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207192406.3809579-1-nphamcs@gmail.com> <CAF8kJuPEKWbr_1a-OzqrYKSPmuty==KhC2vbTPAmm9xcJHo4cg@mail.gmail.com>
 <CAKEwX=Oj0Rur8i9Oo7y2Py7svx-g11sEj3GKQfMVL62x=4hvdA@mail.gmail.com>
 <CAF8kJuNpnqTM5x1QmQ7h-FaRWVnHBdNGvGvB3txohSOmZhYA-Q@mail.gmail.com> <CAMgjq7AjO=Z4Wa3DYaOJdWA+8aNQ1JHZQYKYOm5-SvvgPPOGKg@mail.gmail.com>
In-Reply-To: <CAMgjq7AjO=Z4Wa3DYaOJdWA+8aNQ1JHZQYKYOm5-SvvgPPOGKg@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Tue, 12 Dec 2023 15:39:33 -0800
X-Gmail-Original-Message-ID: <CAF8kJuN=E0RA_JyVnAVraYSyHx5sk=znM2A-JKnAfDc4M2BYGg@mail.gmail.com>
Message-ID: <CAF8kJuN=E0RA_JyVnAVraYSyHx5sk=znM2A-JKnAfDc4M2BYGg@mail.gmail.com>
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
To: Kairui Song <ryncsn@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, tj@kernel.org, 
	lizefan.x@bytedance.com, hannes@cmpxchg.org, cerasuolodomenico@gmail.com, 
	yosryahmed@google.com, sjenning@redhat.com, ddstreet@ieee.org, 
	vitaly.wool@konsulko.com, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeelb@google.com, muchun.song@linux.dev, hughd@google.com, corbet@lwn.net, 
	konrad.wilk@oracle.com, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, david@ixit.cz, Minchan Kim <minchan@google.com>, 
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kairui,

Thanks for sharing the information on how you use swap.

On Mon, Dec 11, 2023 at 1:31=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
> > 2) As indicated by this discussion, Tencent has a usage case for SSD
> > and hard disk swap as overflow.
> > https://lore.kernel.org/linux-mm/20231119194740.94101-9-ryncsn@gmail.co=
m/
> > +Kairui
>
> Yes, we are not using zswap. We are using ZRAM for swap since we have
> many different varieties of workload instances, with a very flexible
> storage setup. Some of them don't have the ability to set up a
> swapfile. So we built a pack of kernel infrastructures based on ZRAM,
> which so far worked pretty well.

This is great. The usage case is actually much more than I expected.
For example, I never thought of zram as a swap tier. Now you mention
it. I am considering whether it makes sense to add zram to the
memory.swap.tiers as well as zswap.

>
> The concern from some teams is that ZRAM (or zswap) can't always free
> up memory so they may lead to higher risk of OOM compared to a
> physical swap device, and they do have suitable devices for doing swap
> on some of their machines. So a secondary swap support is very helpful
> in case of memory usage peak.
>
> Besides this, another requirement is that different containers may
> have different priority, some containers can tolerate high swap
> overhead while some cannot, so swap tiering is useful for us in many
> ways.
>
> And thanks to cloud infrastructure the disk setup could change from
> time to time depending on workload requirements, so our requirement is
> to support ZRAM (always) + SSD (optional) + HDD (also optional) as
> swap backends, while not making things too complex to maintain.

Just curious, do you use ZRAM + SSD + HDD all enabled? Do you ever
consider moving data from ZRAM to SSD, or from SSD to HDD? If you do,
I do see the possibility of having more general swap tiers support and
sharing the shrinking code between tiers somehow. Granted there are
many unanswered questions and a lot of infrastructure is lacking.
Gathering requirements, weight in the priority of the quirement is the
first step towards a possible solution.

> Currently we have implemented a cgroup based ZRAM compression
> algorithm control, per-cgroup ZRAM accounting and limit, and a
> experimental kernel worker to migrate cold swap entry from high
> priority device to low priority device at very small scale (lack of
> basic mechanics to do this at large scale, however due to the low IOPS
> of slow device and cold pages are rarely accessed, this wasn't too
> much of a problem so far but kind of ugly). The rest of swapping (eg.
> secondary swap when ZRAM if full) will depend on the kernel's native
> ability.

Thanks for confirming usage needs of per cgroup ZRAM enable and
flushing between swap devices. I was hoping the swap.tiers can support
some thing like that.

> So far it works, not in the best form, need more patches to make it
> work better (eg. the swapin/readahead patch I sent previously). Some
> of our design may also need to change in the long term, and we also
> want a well built interface and kernel mechanics to manage multi tier
> swaps, I'm very willing to talk and collaborate on this.
>

Great. Let's continue this discussion in a new thread and start
gathering some requirements and priorities from everyone one. The
output of this discussion should be some one pager document listing
the swap tiers requirement and rate the priorities between different
requirements.

Once we have that nail down, we can then discuss what are the
incremental milestones to get there.

I am very interested in this topic and willing to spend time on it as well.

Chris
