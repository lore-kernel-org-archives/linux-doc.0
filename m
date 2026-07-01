Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E81372064
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 17:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782927229; cv=pass; b=G1B00xkyjodDQFhfOkvgrQ3xS3LlobQgymeZdlQiwQH9fzETwLRc966irEm+zk94Tr9KAiFGlkNZbAR9DFG5si5LdI+Zz/fxiL6M/LJtMfNB6KP6z2OiGjTM9Ko5OIQ2NLclC57o89p+5e9omIJR4qmr9EyIAbpjO+m2FFIBXTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782927229; c=relaxed/simple;
	bh=p5R67W3mQFUj88EQqP8gtF/p9rFiSzUfpWVxgBJBTzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DtXb1n/NcqBsvoCNEcJHcDtgIJFTV1SHZ/lb5mw8Ao3n1Gww3s15mPV4aaU7aa3Emuhmv4xvmKPwI2MIfvzHqh9avr4aDBN+Sn0rZotJ4m+xkuCtJwHrCBZ3auYpSbhoPooIQfPDJsNRqfteskC375KOFzOPbCwOogGAGc1u6E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hF98tdGx; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hF98tdGx"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-473dc4cf238so583856f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 10:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782927227; cv=none;
        d=google.com; s=arc-20260327;
        b=A+EG8BibM97tJRMjbZNfvI6k42r3MRHMnTuwPxKwqKIrSgyT5ZboGWIVp+PlR5ng9W
         l3fzUqvxfHa+uvlkWqd8LtAK2++KwaMytoHg7bpcn8+qqRIjZHm4JTW1orRY9XYfsaP/
         vZWqV5ihg/zB49tI1tl88d7ssxNCLN0Xw8eWBaxHPCrnosQvNxxsMhqIYLXYxdt68fyn
         1mFVH9H83v7WPionrOMh3twLQ7DJxQWe1UhBZIDcp+iBLgroIkwCXNu5403gefJeJn9n
         36TFzMvdd1OPU0tKavO6epQ3FvpJtBQE4jaNgUAc5NZTv2geqYfAZwPRApHdpsLVr4MC
         UNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BLYniQWTkrnaZMuzcboN6JdTfeobG7HIxzFb5zfv/DI=;
        fh=r5gZHq74RoRxMztf8SSMyHO8sNiDsDqyWc5Knp466yA=;
        b=VBEgbyBC6aVkk/T5NJ2ragiFPpBQMh7T4868DIMHi0O9J7ELuDqqTLsUBe/EFB/y4q
         tnRuZo0mYVTHBKiSQT6ZWZKej9yy9Mf9xxfyVq248zE+Vz3wZrJUtC7UABsd+D5Vw8xT
         qv5uWpEBCPjXlEpWuVWg4JtHj5YhALmh5HqCgzCzUHyOhTg7Um7UUm/HI5I3KcitbR+W
         tvj1VseTbJujhbW9DLTm+QEaCIOZKRs+VjMZojyo1q3OtWfig6hwZPyICFnn6lW6abc0
         3q8WVNtdAewebYv8QNTDWMnviCNqZaVcXm3zylNXOS105Gq+LcA0KcamlAhtGMrL46xh
         Onxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782927227; x=1783532027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLYniQWTkrnaZMuzcboN6JdTfeobG7HIxzFb5zfv/DI=;
        b=hF98tdGxMGoDxdpgvHB37c2b1GxURIUIEhT3M6rmyoH2ElaKOujbRwzZkc6VYmDlAg
         bhZkqRBpL+1r2OOqY3RIxeC/VS+kbx6RRIdoVGdVpTwUtnC5MWD0L/bcwcjw59ZqI3ZK
         ZT7uCZx2z0GdhywvHTTaiZGnzWGqt3FP33oPCIT8E18M7ewO8vx5D+fkbbcPJgvZqFZT
         HMkUWQxN02pG5OvJey9yl0yKg2rkGVps67nUOB195b9pCVDT/xTb57l6MMReKF4Y0+3Y
         p2Eqj6jxSDDTY35JkiRSNV9KGrAbA3AMT0TAVWuufC8aTuk1MH7mTkX9AlLYNYaFVlSq
         aslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927227; x=1783532027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BLYniQWTkrnaZMuzcboN6JdTfeobG7HIxzFb5zfv/DI=;
        b=gUErWO2EC6j6yR5T9uhd/zXvnUxrbnGPtB9zrueWiC0CIkGv3dk0o6rQt1cZsdZFJ0
         q8rh8pP20fGCFANFt5o4a/4enQ1oAxbaciKc416FibEa5aNB5LS4el5G5cyrG15venb3
         +N3c1zFmS/vSu9HA74js6OuB7gHNqcAOQcv8w1Ea9dEsNQSYWatFxwj1se5YL25fzsIU
         bo6kR0o6RVprLHah/8g5VK9B44bcHYq64g7X+yEq+srJ4+/j2iPYM8diLHCBlXRhW2pO
         m0ZsAsxxgRLNHy30ut3o+9uFNQlxXi+VaHBZ47zPmRDExecdeVNQsgBT7rK+vcI7NUSu
         Ghxw==
X-Forwarded-Encrypted: i=1; AHgh+RoFJ8FD2cGoF4OEKapzNobhqN1Es96DSNQWv2OceIgNY5Aj6sR/NNxzoknzC6Lo/aQAz9qz+uZDg2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJmsrTnY6dyZP1IxAgdLsfy44LjdE46JCg82cwfIjBnDfaS+OM
	/jybsBIoxds1N8mdk6iZpAhoqYsfXF3o3G05h7z+4/y/Pz8clAI7RP7LGnTO6vrv5im0Ic0l+FC
	CXxvUqxZY7JmQ2GUHYa4Mk0bAIMpznmU=
X-Gm-Gg: AfdE7cn3XPqU6G+GqIU9v8SwWt2UOyKAo4sZWflzqwdRSNjveFmdhMofZOCw4gkANqy
	I2YpOzONfSgSHXJy5Cu+g3On1v/RgFiFIGY/h2b5X3rDO4gkqsfk4fRZUnvVhG+BebNuShQC1XT
	G0dKEIgDx7V/RtY2vPYkd2USTu4h50pByOy1OGlcwID8+gul7ZjxKSYmNh9N0moUcMgu+p9iyqc
	3lzZccK7HVF01hEl7NGBtR6JxWcEzhO1pXGyCrCp/UCTrWhScWDetR60p914CRnwIIYZBt4ZPjN
	ow+GshVvpVKCyJMkcqKK+KyPVUE7
X-Received: by 2002:a05:6000:4694:b0:477:80fa:f462 with SMTP id
 ffacd0b85a97d-47780faf939mr2424022f8f.35.1782927226685; Wed, 01 Jul 2026
 10:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-2-jiahao.kernel@gmail.com> <CAKEwX=MniM-4-aV17aH3UiDd_Xd2RH743fFZaxEnYX9qvnokeA@mail.gmail.com>
 <fe15eb9f-0b6c-dcaa-d0a7-5f08c3f92bfb@gmail.com>
In-Reply-To: <fe15eb9f-0b6c-dcaa-d0a7-5f08c3f92bfb@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 1 Jul 2026 10:33:34 -0700
X-Gm-Features: AVVi8Cdct_XjHaPzkM59ofcoatqWxjHDMf7QaZzgYToPCg0_6braxznx6KIBQEo
Message-ID: <CAKEwX=MH+0yixjrbTR3aOE7V0MH=GAP9yKzHGqHizNZm0DBbZQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] mm/zswap: Fix global shrinker when memory cgroup
 is disabled
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: yosry@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 3:51=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
>
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 4b5149173b0e..9d4f19fc440e 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1361,11 +1361,12 @@ static void shrink_worker(struct work_struct *w)
>                  } while (memcg && !mem_cgroup_tryget_online(memcg));
>                  spin_unlock(&zswap_shrink_lock);
>
> -               if (!memcg) {
> -                       /*
> -                        * Continue shrinking without incrementing
> failures if
> -                        * we found candidate memcgs in the last tree wal=
k.
> -                        */
> +               /*
> +                * A NULL memcg ends a full hierarchy pass (except when
> memcg is
> +                * disabled, where it is always NULL: fall through to
> the root LRU).
> +                * Count a failure only if the pass found no candidates.
> +                */
> +               if (!memcg && !mem_cgroup_disabled()) {
>                          if (!attempts && ++failures =3D=3D MAX_RECLAIM_R=
ETRIES)
>                                  break;
>

With Yosry's suggestion:

Acked-by: Nhat Pham <nphamcs@gmail.com>
