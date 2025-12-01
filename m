Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14792EC093
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 09:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764579678; cv=none; b=uN5oj2P47F2qvWvTMYnVFM8910au/NfplcP+IsCFpip75UZYyjEf5gpyJ9yKRyY9O/BAKjdowGaX4sY2gSuwlDaZS4hgT2VwPcZMjam4kDxwrmbgoYcwDxrqQi8PoEACN/enIJcVYt+C4rMrmp34nI3y99ESernrBfGl4/89RHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764579678; c=relaxed/simple;
	bh=fqTz+Z4akEndFYni7EtiKeemTHjAZXy7l4xt8JiUhAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7fDBjnm9ktYIUazQ0Doezi45JHw2pA1xC+b/H4vn8u/cnyeTUt2jFVg7EAIq6lkRm7rt0b910nYT4a0VNZlJMTy7S/o+8aKIXXPolSIo9q21aiie9xqsFxG/UEm/36T6bOzvBczojwdaMpviaa8mdLwzscsCb40Rh3Y8cpt3nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqqveNel; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqqveNel"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64165cd689eso7327779a12.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 01:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764579675; x=1765184475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxmnSSeFCevDFxHXP8UnjPd3wrJiEWtNZQwj48atiFU=;
        b=MqqveNelmzdgzNyjEhXyrp46K1UP4T3BZEH8SYR+l2raPz0f8hABZPZKIT9ziU3HLM
         1zPpEVUvcPZ4ywBA2Uvy5vkCGjyvsAElf5qSMVgbTHvDV09sOewXxjwPSkdp/qPo/KdR
         r6t6AXy/0xKHdH9fe3WyKn+AuHZkWUwYenJ/cJt8Cg6FxSvviYYebB6qUEjsM04IBy5N
         yLAftRxCUEqBiXukpEk7aknhJuaFlsst1kzKnueDulQ5S8QkB6y38MWNcwWFm6N8Unvi
         cqA5YWR26Oyiodp/8BaDIl0otUXcZ/5toX5hvHmjsrJ/w+iUGIzH59kaePQxoc6mAl3y
         nadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764579675; x=1765184475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxmnSSeFCevDFxHXP8UnjPd3wrJiEWtNZQwj48atiFU=;
        b=MhksTCiaRCOOjxEQrnkESd7eqD81XiSGao3ExLAaY7kDsqCMxRmd7S8dJ3SO9ssZbr
         pmlw2Nteq5a3rVd1iOhcJWXBkLgszCJoSouCNON91+awoP05qLrCUN4p12QT1fpIiQjB
         Lmgjd7+eI72cR7maH0G0sZK3F45EgpjhHSccy9LJgIH3rmao12vAnC2CufAF3BVdi+az
         v4UwTxGv5qrgQvs0gsBOk4t59GPULNu/BMdvCueQRQWuxmVMzQr6JYlumhfSvuN0DOG1
         WQEHbQ4koj2E5h7J9rmzza6UARL3YXG4O0LXeX/UIqBjjQw/8BAcnY5Csn6bhhm6D5/4
         2LZg==
X-Forwarded-Encrypted: i=1; AJvYcCUOxt9x70izd2nEP6SvQswvpzP0obQtycMemThPOHaMSMDXws57OIGsqRksUyFbMe5welrQ8f9o77M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5O1k62CGkrnp5r+tc2XoD6kjEjYQYSaoMbu4Tx1HpionYWORh
	V2fd+2SMkJlQ88QlUdeLDpxYf1N/kbCOEHMX9yAO3Mkurg2hIQ++0MjJI/xXZoaSiqwcViuE98U
	agjsIjVmCySkxVGck1Q1X/lSkUtumdwc=
X-Gm-Gg: ASbGncvf/pchncKeNQqScnTjsJhD/4N8xzddhWqT/6t1JophYnkZXHSyDHbn8wYo8HS
	m4jeQ+yhTPHL+htTQQ6cVDFI3lmf5KWCj8YcHdIauOzM2KSkjmwIZS42QXfFxk/VFeeicjsmgSW
	qHujRfpVuUXkwcTYnqNgM8pqE75QVxbb64m8W1olRCOevVRYpK3SLtqFPrVPob4wej6ZaNpuJlf
	oJ+VatyHaKasA188HpRHQIk0UqaFOkVaxqBZS2nW0M4LByvve9uV6ob5hitZtWdlQmjlZ3T8ZHp
	Rf58zUV782SjkWVPpqi7iJYlQqg=
X-Google-Smtp-Source: AGHT+IEgR1DdVllyHOeHiRvvKQbP5W/yciHkiXXT8zXV8yo4kCCAug8/rhvvEwNd/SEZmh5QwfddA+G1su9EGVjpcHA=
X-Received: by 2002:a17:907:1b14:b0:b76:3472:52df with SMTP id
 a640c23a62f3a-b766edb87fcmr4030364266b.10.1764579674291; Mon, 01 Dec 2025
 01:01:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128025315.3520689-1-wangzicheng@honor.com>
 <aSm800KsCAptVZKu@casper.infradead.org> <ti7h5cbrg5s3zf7surof3zmxb6supnl34x7hsbziqutm7r2laf@zuunap5hwsbx>
 <CAGsJ_4xJ5qMght93FQOYrk1OiJTh-wFC4e8Nd4K0A156N3ZEBQ@mail.gmail.com>
 <86c62472b5874ea2833587f1847958df@honor.com> <CAGsJ_4w1jEej+ROuLta3MSuo4pKuA5yq7=6HS5yzgK39-4SLoA@mail.gmail.com>
In-Reply-To: <CAGsJ_4w1jEej+ROuLta3MSuo4pKuA5yq7=6HS5yzgK39-4SLoA@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 1 Dec 2025 17:00:36 +0800
X-Gm-Features: AWmQ_bnswMDYfF0lQTLx1DlxQcT6Wt6rEWzfD7LxVrDE92N05MOtOpqZN120qhk
Message-ID: <CAMgjq7DOPMp3Eq9_SxmxNhY7S5--3uf0PByNAJOAEne9hb+T9Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/lru_gen: move lru_gen control interface from
 debugfs to procfs
To: Barry Song <21cnbao@gmail.com>
Cc: wangzicheng <wangzicheng@honor.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, 
	"david@redhat.com" <david@redhat.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, 
	"yuanchu@google.com" <yuanchu@google.com>, "mhocko@kernel.org" <mhocko@kernel.org>, 
	"zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, 
	"shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "weixugc@google.com" <weixugc@google.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, 
	"surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wangtao <tao.wangtao@honor.com>, 
	wangzhen 00021541 <wangzhen5@honor.com>, zhongjinji 00025326 <zhongjinji@honor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 3:46=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrote=
:
>
> On Mon, Dec 1, 2025 at 2:50=E2=80=AFPM wangzicheng <wangzicheng@honor.com=
> wrote:
> >
> > Hi Barry,
> >
> > > Hi Liam,
> > >
> > > I saw you mentioned me, so I just wanted to join in :-)
> > >
> > > On Sat, Nov 29, 2025 at 12:16=E2=80=AFAM Liam R. Howlett <Liam.Howlet=
t@oracle.com>
> > > wrote:
> > > >
> > > > * Matthew Wilcox <willy@infradead.org> [251128 10:16]:
> > > > > On Fri, Nov 28, 2025 at 10:53:12AM +0800, Zicheng Wang wrote:
> > > > > > Case study:
> > > > > > A widely observed issue on Android is that after application
> > > > > > launch,
> > > >
> > > > What do you mean by application launch?  What does this mean in the
> > > > kernel context?
> > >
> > > I think there are two cases. First, a cold start: a new process is fo=
rked to
> > > launch the app. Second, when the app switches from background to
> > > foreground, for example when we bring it back to the screen after it =
has
> > > been running in the background.
> > >
> > > In the first case, you reboot your phone and tap the YouTube icon to =
start
> > > the app (cold launch). In the second case, you are watching a video i=
n
> > > YouTube, then switch to Facebook, and later tap the YouTube icon agai=
n to
> > > bring it from background to foreground.
> > >
> > Thanks for the explain, that's exactly what I meant.
> >
> > Android lifecycle model isn't obvious outside the Android context. I=E2=
=80=99ll make that
> > clearer in the next version.
> > > >
> > > > > > the oldest anon generation often becomes empty, and file pages =
are
> > > > > > over-reclaimed.
> > > > >
> > > > > You should fix the bug, not move the debug interface to procfs.  =
NACK.
> > > >
> > > > Barry recently sent an RFC [1] to affect LRU in the exit path for
> > > > Android.  This was proven incorrect by Johannes, iirc, in another
> > > > thread I cannot find (destroys performance of calling the same comm=
and).
> > >
> > > My understanding is that affecting the LRU in the exit path is not ge=
nerally
> > > correct, but it still highlights a requirement: Linux LRU needs a way=
 to
> > > understand app-cycling behavior in an Android-like system.
> > >
> > > >
> > > > These ideas seem both related as it points to a suboptimal LRU in t=
he
> > > > Android ecosystem, at least.  It seems to stem from Androids life
> > > > (cycle) choices :)
> > > >
> > > > I strongly agree with Willy.  We don't want another userspace daemo=
n
> > > > and/or interface, but this time to play with the LRU to avoid tryin=
g
> > > > to define and fix the problem.
> > > >
> > > > Do you know if this affects others or why it is android specific?
> > >
> > > The behavior Zicheng probably wants is a proactive memory reclamation
> > > interface. For example, since each app may be in a different memcg, i=
f an
> > > app has been in the background for a long time, he wants to reclaim i=
ts
> > > memory proactively rather than waiting until kswapd hits the watermar=
ks.
> > >
> > > This may help a newly launched app obtain memory more quickly, avoidi=
ng
> > > delays from reclamation, since a new app typically requires a substan=
tial
> > > amount of memory.
> > >
> > > Zicheng, please let me know if I=E2=80=99m misunderstanding anything.
> >
> > Yes, but not least.
> >
> > 1. proactive memory reclaim: yes, that's we are after.
> > When an app is swiped away and kept in the background and not use for a=
 while,
> > proactively reclaiming its memcg can help new foreground apps get memor=
y
> > faster (instead of paying the cost of direct reclaim).
> >
> > 2. Anon v.s. File: *bias more towards anonymous* pages for background a=
pps.
> > With mglru, however, the oldest generations often contain almost no ano=
n pages,
> > so simply tuning swappiness cannot achieve that -- reclaim will still c=
lear file cache
> > in the old generations first.
> > To some extent, file caches are `over-reclaimed` in such senario, leadi=
ng to a disaster
> > when user=E2=80=91interaction threads get stuck in direct reclaim of an=
on pages.
> I strongly recommend separating this from your patchset. Avoid including
> unrelated changes in a single patchset.
>
> MGLRU has a mechanism to ensure that file and anon pages can keep pace
> with each other. In the newest kernel, the minimum generation is 2. For
> example, if anon has only 2 generations left and we decide to reclaim
> anon folios, we will fall back to reclaiming file pages. Sometimes,
> this means that anon reclamation is insufficient while file pages are
> over-reclaimed.
>
> static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>                        struct scan_control *sc, int type, int tier,
>                        struct list_head *list)
> {
>         ...
>         if (get_nr_gens(lruvec, type) =3D=3D MIN_NR_GENS)
>                 return 0;
>         ...
> }
>
> This is probably not a bug, but this design can sometimes work
> suboptimally.
>
> Regarding this issue, both Kairui (from the Linux server side, cc-ed) and=
 I
> (from the Android side) have observed it. This should be addressed in
> MGLRU's code, and we already have kernel code for that. It is unrelated
> to your patchset, so you shouldn=E2=80=99t include so many unrelated chan=
ges in
> a single patchset.

Thanks for including me in the discussion.

Right, we are seeing similar problems on our server too. To workaround
it we force an age iteration before reclaiming when it happens, which
isn't the best choice. When the LRU is long and the opposite type of
the folios we want to reclaim is piling up in the oldest gen, a forced
age will have to move all these folios, which leads to long tailing
issues. Let's work on a reasonable solution for that.

>
> Please keep your patchset focused solely on whether the MGLRU proactive
> reclamation interface should be promoted to sysfs (LRU_GEN already has a
> folder in sysfs) instead of debugfs, if there is a v2.
>
> The following is quoted from
> `Documentation/admin-guide/mm/multigen_lru.rst`.
>
> Proactive reclaim
> -----------------
> Proactive reclaim induces page reclaim when there is no memory
> pressure. It usually targets cold pages only. E.g., when a new job
> comes in, the job scheduler wants to proactively reclaim cold pages on
> the server it selected, to improve the chance of successfully landing
> this new job.
>
> Users can write the following command to ``lru_gen`` to evict
> generations less than or equal to ``min_gen_nr``.
>
>     ``- memcg_id node_id min_gen_nr [swappiness [nr_to_reclaim]]``
>
>
> >
> > See the case in the cover letter.
> > ```
> > memcg    54 /apps/some_app
> > node     0
> > 1     119804          0       85461
> > 2     119804          0           5
> > 3     119804     181719       18667
> > 4       1752        392         244
> > ```
> >
> >
> > Since the semantic gap between user/kernel space will always exist.
> > It would be great benefits for leaving some APIs for user hints, just l=
ike
> > mmadvise/userfault/para-virtualization.
>
> Nope. This is just an internal detail of MGLRU and shouldn=E2=80=99t be e=
xposed
> as an interface.
> Hopefully, Kairui or I will send a patchset soon to address the balance
> issue between file and anon pages. For now, you can use `swappiness=3D201=
`
> as a temporary workaround. Take a look at bytedance's patchset.[1]

Agree, Thanks!
