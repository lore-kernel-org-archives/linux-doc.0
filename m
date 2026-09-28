Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4364C4E4C40
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 19:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622938; cv=none; b=hK93alj6ZFrjHTKIFngBiq1M6qEP2+qQ2F4iT4MctRht7Dbb14JhPeqozgFKG8dnRCu5mnFZRnRKW8KXkUj0ErhysehDa++s8oRRGEVfW4n4Dgvxq6X83G9/jawQAWAmbTJpEdbDbGPWiWO10ILWTx4vVZZ0fQ7vQ3g33WFWmEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622938; c=relaxed/simple;
	bh=cnSkWhVxKLSHuvDTlQufv+EuF2rraS4RcqOQGjemejk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FqPM+WUTOaaRveTvssvRh22MOR9uqv4x1O6tl5uGikGCwKdUxWBJlN8hLYAYrw46kzQbz2QIz3DcQ9/hfJkcx58r6dsKnMA9JuFqrngW4JTCGcgNobwpA0UlbHT9vuYuMq3CURtFhq6SGJF4NidPmiwiXIXeunXdo7uJYyFSLh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1ul2MGa; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1ul2MGa"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc79a5bdf9fso419047a12.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 12:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790622936; x=1791227736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RgWd/l9HpKlKhvcWTT1u0c7+1pXvz8TwXeJa3yLEX5w=;
        b=K1ul2MGaTUlcU8VoW/vtt3h45V2MYm/YBvwbZR91EXDoyl13W6Q8fgtqYxlszs1w4e
         wp7lCYHPu49E9isGQ+3ibE7C+C/+5nAtA0J65wEy6fthROkkZGuF0j6Ap9WOMGF5rHlT
         DFyUjqpI+xrWZZG5t1vjeOiCx3DrHFW9+k6dQ7UoylvJrk8XhYU8BW2iQ7tMgZ87FC6r
         B0lpOhAXr28bilYzaCElM46svxOF0h1gVXFvcH/hc1GpvjtujJ6KtxhuHnz8q5tbz7c/
         E+1pCkt+/qMWoLpTcnhmp9bHSWnexnCmJ5QMYIzudhzS/liYFOGoFZIyRQXUW1BTXaP8
         hsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790622936; x=1791227736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RgWd/l9HpKlKhvcWTT1u0c7+1pXvz8TwXeJa3yLEX5w=;
        b=R5sbKShcmwfcRAZbJnUS5nldgsP0vopunNSWHelhUe1lzaBFu+ZKli4TuUlUfUX2Z3
         Gr5Hr4pJsk3rxhnmySZJpoMRsFWlz4a4DrHuhI1VAE91h7WG20ELBEeXMy29dxLykq7U
         dzF2j4mNd9WYZSdVa5K3tj//NZnMzlojAt+4Rvf+2XTPSO5PYrxxxDBFjLAmDav7p3oa
         3VvPxVoqWxRt4lw/JId24dV75jsQCUV0xO3nHzNsvm/nSv3ZrNYjtjzTBn01UKPZ/b7a
         40SMdHVrtEAD8gmgEIto8BlwExx33cqpeIJ2+Daf0Sb6MPTQBy31SVv3q1kL0LisIr1g
         941A==
X-Forwarded-Encrypted: i=1; AKwUvByZKg2RpuVoAAt8fPSy59bwDTrRpXo5S+4Q3ccfesmN0p3IW4LsAy5VBhsPany2psz8bwqsJDKRLH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT0wVelZ0sfu4gYh4oemRbBk6dODZop/AKdqh4ZZUYY0Ypam2c
	RmSkSxtJx6sRx9nfgpE6a8lTEhxwkrKk3cFNyFLX98s2PuWfNAjcADYU
X-Gm-Gg: AYBFou1L3SUecXw1etMhg/DATzfnjUXmswxIGCeWHMIQU7gsx2LAOOIjrtSsi6j8Isz
	cXxzWAeGdvWh789g/gf2A4o0P459A38facNeajSr4zDsNRnTD7DV17tOcwy/K7R0jRiF/VsLOyf
	mZR69Qmh0C/xQDn3+CJwl79m3SUHZlW5X2OVyuLeq8nO7A2oy7PlkB/FYZrQgaIvLXCVpEhaX+7
	0stfChvKRDtC/bLbE/TU3JjzfonT8DPyMMj8jl4tGCJy4ikHcqWprjwgCE1S/frCf9FhRJMV322
	CYtyuiL2Lhk05UOWhTgxw5YW4OeIi8G/uoYYSMQ4z3BMJkXhU8QnQw0ouHxB04MsRhm7SFDWpPz
	DEF/mTOFBfdqzVLeUkKj9jBlnR0UjDXO5sptIPaBbT+FsQPUHKy307CkdNkVNIUjKAT5AWAfWEd
	SxRdPZ6QWkhF/kVjTJ4TZtN9NYgYSl4xX3vttyINvktcPP+4TOcvODSV43cRonxpLaLOydeURU5
	+mrezTiC9V7jW3iThnuMpuTiE0P6eBDAo5OYgTVoP9D4nWfMud2g+E3smiDazHlCnUqw/dd7Bl/
	Yne0SP6Rz6L+At9eXPDS
X-Received: by 2002:a17:90b:5648:b0:3a0:e985:9ca2 with SMTP id 98e67ed59e1d1-3a49c1a1c55mr90738a91.31.1790622936500;
        Mon, 28 Sep 2026 12:15:36 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net (2001-b011-2006-1fb9-8409-0195-705e-5b47.dynamic-ip6.hinet.net. [2001:b011:2006:1fb9:8409:195:705e:5b47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49c1afb23sm284314a91.16.2026.09.28.12.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:15:35 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Yiwei Lin <s921975628@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rbtree: update augmented data on the way down in rb_add_augmented_cached()
Date: Tue, 29 Sep 2026 03:15:26 +0800
Message-Id: <20260928191526.645160-1-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928140513.GF4121620@noisy.programming.kicks-ass.net>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2026/09/28 22:05, Peter Zijlstra wrote:
> > And that is *very* close to being generalizable, obviating the need for
> > RBCOMPUTE. Does your LLM see a way to make that happen?
>
> Perhaps by doing something like so?
[...]
>  #define RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,			\
> -			     RBSTRUCT, RBFIELD, RBCOPY, RBCOMPUTE)	\
> +			     RBSTRUCT, RBFIELD, RBCOMPUTE, RBAUG...)	\

Yes, and since RBCOMPUTE is always "reset the fields to the node's own contribution,
then fold in each child". I think we can also generalize it with RBMERGE, by
adding one extra RBINIT:

        static inline void min_vruntime_init(struct sched_entity *se)
        {
                se->min_vruntime = se->vruntime;
                se->min_slice = se->slice;
                se->max_slice = se->slice;
        }

So the original RBCOMPUTE can be generated by the template instead, which allow us to
remove min_vruntime_update.

        static inline bool RBNAME ## _compute(RBSTRUCT *node)                         \
        {                                                                             \
                typeof(node->RBAUGMENTED) aug;                                        \
                RBSTRUCT *child;                                                      \
                                                                                      \
                RBINIT(node, &aug);                                                   \
                if (node->RBFIELD.rb_left) {                                          \
                        child = rb_entry(node->RBFIELD.rb_left, RBSTRUCT, RBFIELD);   \
                        RBMERGE(&aug, &child->RBAUGMENTED);                           \
                }                                                                     \
                if (node->RBFIELD.rb_right) {                                         \
                        child = rb_entry(node->RBFIELD.rb_right, RBSTRUCT, RBFIELD);  \
                        RBMERGE(&aug, &child->RBAUGMENTED);                           \
                }                                                                     \
                if (!memcmp(&aug, &node->RBAUGMENTED, sizeof(aug)))                   \
                        return true;                                                  \
                node->RBAUGMENTED = aug;                                              \
                return false;                                                         \
        }                                                                             \

Base on this I have another idea: can we let augmented data becomes one member and
init/merge just work on its type by value. Taking sched for example:

        struct_group_tagged(sched_aug, aug,
                u64 min_vruntime;
                u64 min_slice;
                u64 max_slice;
        );

So fair.c's se->min_vruntime etc. can stay as they are, we don't have to rely on the
FOR_EACH machinery. Do you think this can be better or do you prefer the field-list form?

Thanks,
Yiwei Lin
