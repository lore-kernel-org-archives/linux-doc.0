Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQvSIYdL"
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E42127;
	Wed, 15 Nov 2023 09:26:03 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-359343e399fso25449005ab.0;
        Wed, 15 Nov 2023 09:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700069162; x=1700673962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxkFYGMJuy8RDq84rB92XeHb3mxQtE5maYApNhXE5PM=;
        b=eQvSIYdLajIFnsBiVxxodSx07kzrQ6cyjnCIjCltjHdUjl+BUw2Vg+urQJIKbRRjFO
         Zc+n9fjtBwaAsr+8LISez3kcpKnsP3EVyolsCA+0tBeaxXAeyHWwBYgHMWaVjlZWB5Vw
         c+VGArZKWPMqgVzf8qTZUHDmvrLmBYglRy9c3MQkv6CYTGvevXDTk6teRzn2QAxslIkL
         PuZ6vquk0RqzkORaodNn3sF/2uNViuVySPkF65bMFicvVBt5jHJgOHl0DdxJtWmfoF7e
         q+bcDkA7kWaguBFrXSEWXr8zcYI1Vm4g+0XMfeXeYMswaUn729Yo1pwmFaSghDtR/F5h
         mN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700069162; x=1700673962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxkFYGMJuy8RDq84rB92XeHb3mxQtE5maYApNhXE5PM=;
        b=lYKD9FOerK+yjGK8v09gZWWUS7ml/3kMq0AzS1IF8WWwi7q2ek2zXuKrsHr0KiXcsj
         lD7VDtDXSLWwiGBM8Y8/kjsXjnUH06JKZd64+I/crGPIuwuo8jslSewiSDfPuDoYSM+w
         GuV0Jl+RsmJgR9Ye1s6R43PSEpQFw3QXfIH9KMGBFrCQXcqZcC/TzYjmwvt/fpVjWFw+
         /W1jopCwTw9V/KK8krByKSLzAzT8d489Tu4UUiU6tvVyHPjXTNVltGnhE3ynejjqR0YG
         ty7iGoOHoUe+kcIcyGhJSU4Q6MNZ0k4WzG2GN+GoWPcWGSxW+ULSUO4eTK2vgCRLxZ0c
         6IDg==
X-Gm-Message-State: AOJu0YypLhnnhy/eyYL4yflSYwtUGLxjUk2YsP3Kdjs/N6kIYfAqfVqn
	hfzXOh85YxML4qU3aPXtTCF05jwWjLfrU0g3pa6UC8Jk6Hk=
X-Google-Smtp-Source: AGHT+IH34e4GBjpe1mpBbZlZSoOKNesoEU1gW9XC0SNba4mFFL+AdZvbgoUXu86ZZicWfkyXXL+Zw0B7saZHo491jAU=
X-Received: by 2002:a05:6e02:b2a:b0:359:4e76:fbf4 with SMTP id
 e10-20020a056e020b2a00b003594e76fbf4mr18185838ilu.13.1700069162224; Wed, 15
 Nov 2023 09:26:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106231158.380730-1-nphamcs@gmail.com> <CAF8kJuPXBLpG2d4sje6ntrA+U-AnLzu3sNpJK02YxNcg04YNng@mail.gmail.com>
 <CAKEwX=OgN_xQWrp_OYkK1BRq3DFW4he9OSycdjBm0BNy+vpPAg@mail.gmail.com>
 <CAF8kJuN--EUY95O1jpV39yv5FDu0OYanY6SZeBPk5ng4kRyrjA@mail.gmail.com>
 <CAKEwX=PT=5nvLhUyMmi=hq0_2H-4kmO9tOdqFvHEtaWF+e8M1Q@mail.gmail.com> <20231114145040.4b90d49d4ace1621c87f9c79@linux-foundation.org>
In-Reply-To: <20231114145040.4b90d49d4ace1621c87f9c79@linux-foundation.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 15 Nov 2023 12:25:50 -0500
Message-ID: <CAKEwX=Nhfd3J03weE2oiGQdV_sPsuPtB6NjvuSYRZBq4Fq0+9g@mail.gmail.com>
Subject: Re: [PATCH v4] zswap: memcontrol: implement zswap writeback disabling
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>, Dan Streetman <ddstreet@ieee.org>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, Hugh Dickins <hughd@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	LKML <linux-kernel@vger.kernel.org>, Seth Jennings <sjenning@redhat.com>, 
	Shakeel Butt <shakeelb@google.com>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Yosry Ahmed <yosryahmed@google.com>, corbet@lwn.net, david@ixit.cz, kernel-team@meta.com, 
	linux-doc@vger.kernel.org, linux-mm <linux-mm@kvack.org>, lizefan.x@bytedance.com, 
	mhocko@kernel.org, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	rppt@kernel.org, senozhatsky@chromium.org, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 5:50=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Sat, 11 Nov 2023 16:06:58 -0800 Nhat Pham <nphamcs@gmail.com> wrote:
>
> > It's a bit of a micro-optimization indeed. But if for some reason I nee=
d
> > to send v5 or a fixlet, I'll keep this in mind!
>
> I'm seeing a lot of rejects against current mainline, so yes please.

I should have been clearer - this patch is to be applied on top of the
shrinker series (which is still under review). I originally included a comm=
ent
in the patch log, but it must have been accidentally dropped when I reworke=
d
the patch according to Chris' and Johannes' suggestions.

Nevertheless, I have rebased it on top of current mm-unstable
(with the shrinker series on top), then sent out as v5 (with the second
suggestion from Chris Li) just in case.

Let me know if there are still issues! My apologies for the inconvenience
and lack of clarity.
