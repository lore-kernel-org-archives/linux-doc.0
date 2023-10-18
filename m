Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A93D383
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 16:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ie5YlKlg"
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F25AB
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 09:34:05 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-41cb7720579so297151cf.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 09:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697646844; x=1698251644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+NGVJ7tldYjua0My5aXg+TSKmTtKYgS0JOgqef3/Ug=;
        b=Ie5YlKlg0pWbcYWT7w269Ez+dcXC+umIwh6orGNa2REViLLwxpPeBD0lOlZpsnvbvt
         SFBmIWU2lrwrFstw8/W+fQ/GfKgkWMRhmV5h3Nrwi1BUNAoQ730egOXykgsieF0EYMAI
         tmtHVm2L3dvauehMdbY4CU20RPcJN3nRFftVwGu3mdTFDX4AMiBe1rIRv2j0ucOjHI7S
         EdDXxzs2XWK9gDF8ThrFJxnOnfX35iKtzvS6Q0rZQylGmAMWswzeFYIbRjO6FeahBpT+
         mL8+CCFpRXJPdAZMjECORDhnPOsB/7iPUOiWQ8ZlU3KXSdcJBRT+UNEFj+Mgc2W9mtID
         vemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697646844; x=1698251644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+NGVJ7tldYjua0My5aXg+TSKmTtKYgS0JOgqef3/Ug=;
        b=fIkBEz4YsSfMvTkxqUDtixbGGnGMeIfZIQx1D7SR9q7Xnf5NAyl7FFralYAtfFaa8n
         gQREP2zrnO/+8mY0jSbpvsTATsabM/lOVDAfi37llbnUNrTeDt+9jULDKPddgiqfqs0z
         yqsQeYThfVQxZ6HJwjshoA+7C/3TQyVMmjcT90SjgI0ihCUU/gbBHyk5FOMnyKJysRwS
         RZf0VM+oUb0dz1cg/SSRCkcMuSnNj+aTwoKwCkQIizY8LCOQaXbdLB1RTMA3APLbcvtq
         byz0HOoVviybFB1JWqfpNy5F93sUVGQqW/jrf47tVDAFwlNZW8tDm1EA4MUVEshYAloy
         5VYQ==
X-Gm-Message-State: AOJu0Yy+nLcuUs6H5YWzKjRh2dL92lZSseLhHQwwt3NLgjHH3G91qU5q
	fZ//yP7R2DDU/edCSoQgKMThdPA/g5SAI2DL/DStjak3YCUo3H1xInQIfw==
X-Google-Smtp-Source: AGHT+IH+s6vAfX9E3nn5vxST3ihYiw3zu36XPDiF4BijlPTOxi2bUpAQeWFd+R64GLEUnoGrGTG2oJpXt7BxeZo2rBY=
X-Received: by 2002:a05:622a:44c4:b0:41c:375b:81a3 with SMTP id
 kc4-20020a05622a44c400b0041c375b81a3mr493qtb.18.1697646844229; Wed, 18 Oct
 2023 09:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009025726.5982-1-link@vivo.com>
In-Reply-To: <20231009025726.5982-1-link@vivo.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 18 Oct 2023 10:33:28 -0600
Message-ID: <CAOUHufaX35Y6MfwKj_XUWXJwdC=9M=g1gXpQpQghBZ2fXrkEAw@mail.gmail.com>
Subject: Re: [PATCH 0/3 RESEND] Per memcg lru_gen node stat
To: Huan Yang <link@vivo.com>, "T.J. Mercier" <tjmercier@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeelb@google.com>, 
	Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, "T.J. Alumbaugh" <talumbau@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Suren Baghdasaryan <surenb@google.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Oct 8, 2023 at 8:57=E2=80=AFPM Huan Yang <link@vivo.com> wrote:
>
> On original global lru_gen node in debugfs, it can all show each memcg's
> lru gen info in "lru_gen" or "lru_gen_full", and can type cmd into lru_ge=
n.
> But which show info contains all memcg's info, and cmd need to
> know memcg's id.
>
> This patchset add lru_gen node in per memcg, with this node, we can
> get lru_gen info in each memcg.
> Also, we can type cmd to control each memcg's lru_gen seq, but, this node
> don't support multi cmd, single memcg just process one cmd once time.

Adding TJ from the Android team. (The other TJ you CC'ed is from the
ChromeOS team.)

This series introduced a new ABI, which has to be maintained forever.
How exactly would it be used in *production*?

Android doesn't officially support memcgs. So I want to understand the
real-world use cases first.
