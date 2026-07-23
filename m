Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6B731E84F
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 14:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817801; cv=pass; b=pJx7tOO71sUmPwABQ07NDjkptAwCXxlKu2k0iiy3MKqRt2kbdM01N/6ma1fPXb9NHR4Hk/aJBmivbzvQVXhG/XRWPF47EG4J74J2ea6l+zlOyvItkWtWm8GVDe3DU/tbHzQscO3wGT8/vy2Bfhif7rTW8U4zJ5GuCCP0myicrqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817801; c=relaxed/simple;
	bh=5Bh13Snw8/LKld3ZLy68siOQFrXb9O9ypzbWa4YekzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5FpsJ4dzhNPBuxrRPbeGpr5EE4BGKGO/pJs+FjCAvOCcEMJL3l1SDHjrMel4cruH6lmgRu3XJKgSMz3OOl3NL5lEH6n2NjqIoGyhyKwBgJwOS/Dgzq9F2+cUSgOM/fAF6mcdGOAl+ZFoQMc6x6c4ApkWH0TLjyIJY0/EylMyHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PHZkwHD4; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PHZkwHD4"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cacef7d299so86695ad.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 07:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784817799; cv=none;
        d=google.com; s=arc-20260327;
        b=aMY460zl3F6FMy6ctqIi1kyxNfcVZkn4lUyRigg08BsAe55KaUwDhgaTVPsn9hbija
         XDFV6LsPkPImiUm9RI72xCJoaEJr6G88oQ4BckbZwL1B1LKiBj/DyQhPr49SKlJ6bhZr
         SfEmC4rTKjTErQhuZOuUacpFb4XLWIetE4Hw4Fmd3LygrdvZ5m04asu2d0SVxAjIH19V
         N4yE5zu/TOTKXKl5Rjgtdt+tzt5wxcpPE7lxvBqwkO9Mk+BOax8sfn0aeqbcMAce6KS2
         TIui64e3AzQn6iXX6EAchHJmRK3JRLsIdY1OEQKnBQoW/kneOMpQhV8mphw4P8dq17x0
         0lTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kInI0j7PfqNfBfbUd3Pq6xvKYabvTs/AAdV3xhy9+eQ=;
        fh=kaP9wp1TE1Rfpo4tKLtltaw9VT6o7c8LHWAWmC8KET0=;
        b=O35JYL7jLM11QXfAY3atFjV7Gudm7MJuoFsCHJqV7vQABzsPJ/EIKkyLVUQ+1bedbv
         bVTJi7wpmGzuDrvdoNca163BrCL2HMit1k/mlsFRxlfva+C5wTXnjJmA32AVpnDkZegY
         iEn+XnBsdhbR1GWMdGm9g2NBBbxHlKaAvwt3epYKI9JL6j9ZSCR5NnU+aSwLfrwdBs97
         7i25tN2upr7PMfelU+RSNxDE7rcyXuIV2l/F3Ms/5QLG4vTCBkvMDV79n2IYddNNr2sO
         q9ZbcaKhnSkp1aATzs+hkSbvI9gzq4gW/ApJx9UqzMPv36WUKv9YV+3PnZV5YwFoLXBN
         WiIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784817799; x=1785422599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kInI0j7PfqNfBfbUd3Pq6xvKYabvTs/AAdV3xhy9+eQ=;
        b=PHZkwHD4AYGECajiX1wdnXWmcGjvn7c7wtZqgmhPWyYprrxSljTAFhoXyKMW0swI5I
         +gtd3hm+CQ1jc8lSGrMIpQVXw0GmVPndI9NGRZx7EvXXCmODyRnDjkNejaU+z2g8D4IQ
         KkTWZnINQOYXUSEwfEEUfp0QnqhdEYFhV024+0IrbZ/MBsdJuXPTaazVxjTyrxkYt8kc
         ln73T37n21iLfDLU4rlqoLZY+d0wSM4V0nYj3XotiyM/WbRgbLX73qknYmoFWQsTsm06
         i2BnQafRhSfLbQBZw1wQeKzTD99shDqMJ9xG5hWya1S1m5Zhf8vCJ0fEEoYfGbU5Qc1r
         Ohwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784817799; x=1785422599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kInI0j7PfqNfBfbUd3Pq6xvKYabvTs/AAdV3xhy9+eQ=;
        b=Zf5p0/7RSNKHjKgxHWNMBVFx5Jlo7XQMT/E3P8yGRDrBxDltaSQVolBEUmK4PVzRD0
         46LG3RI1BlyahpMlHVlrjgea4pTeIe9tYmSqjm8a11zwwjd9ArYU+840TbCHXjx7o/um
         PzVXgXVPp7qBGxdW+YphZoD3BuMCBt5YyqIRyoqLIyHJgvZbOZuy3H5vGx+uc2SbguLI
         AhkXftUrU6l4ZzGPAFyoBn0gxikXtg20jQ5FoU5Ze0NFB+fMgrn53ol/OJKpfruIbDDV
         rzyfgBO/unVNlXGoMNWUGTNQCcCOysI1z+OI3ifGCanSnhtqrCnXMuIeuVPTogjeWojL
         Q87Q==
X-Forwarded-Encrypted: i=1; AHgh+RoSVLojy7D1A7zEl3+n8feIAZAHGNMjbr+7VxhyZsSoc/BtK5UcF4PmBi3m4QX75h0AroTTXExNlKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF3yLR3o0s8cqss4KqyrD+/w1H/oMbQCVByMcmjA23GoQ66jvo
	K/t5UEBrUiQthi8pjbqjdEAmyIquAAm6GY3cAa5vF2Iap15lGOu17fhZRsAZm5on6SLV2DGl/uZ
	SdjPr906bVBYkuFZlfVLX2DWIMvCE0FMBGoch0+0y
X-Gm-Gg: AR+sD11WGyxtT9lQKxbJ1JTHM3io8BCx/sFTJJl68g6CjMu/UC9yizSnL5yl3Ge0ViF
	waV10Wcnm61DpiE3pYWdrc9tvFSENzNHmpoj/JllFrbtO+lLqk/ES7TjmlYd6PEHsMn5Edn/GdT
	nz6waRJ+9kPSpiiVFjU4vJe0LbNL9XNSJL4t0X0oL84/JDeAra29areIn0M4gFNYiiwwAfKMWv9
	iFWZujYEucZ8vVh1Tmq28MaUy+dnNTCUGUHzFqhVDIzQSazhY/4a/IWMTzQAgNFi0vLHhIeGnyn
	olh7o3M2I41YHD/u0RBlfljOEnMc0e8HMHpEnAXwHkz8yH2ZYw1ZqB47HQ==
X-Received: by 2002:a17:902:f0cc:b0:2ca:cbe5:c3af with SMTP id
 d9443c01a7336-2cfa805b497mr2620685ad.7.1784817798592; Thu, 23 Jul 2026
 07:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723-work-failfs-v1-0-3f69b9a9e958@kernel.org>
 <20260723-work-failfs-v1-4-3f69b9a9e958@kernel.org> <CALCETrVDX-PcSJoHFwymh7d=oUKotJQQuh+AzmsA7YQySBzD3w@mail.gmail.com>
In-Reply-To: <CALCETrVDX-PcSJoHFwymh7d=oUKotJQQuh+AzmsA7YQySBzD3w@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 23 Jul 2026 16:42:42 +0200
X-Gm-Features: AUfX_mxwR2szFPQcNEOJk5c8uPwGThX-tGJ2GY340PPIRSnfxESd4tzYNTgrDSQ
Message-ID: <CAG48ez0P6baYhaL4_U_S-wjQX7366WkSm83OQ5ZpUjmu1J2BNg@mail.gmail.com>
Subject: Re: [PATCH RFC 4/7] fs: support FD_FAILFS_ROOT in fchroot()
To: Andy Lutomirski <luto@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	John Ericson <mail@johnericson.me>, linux-api@vger.kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Farid Zakaria <farid.m.zakaria@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 2:49=E2=80=AFPM Andy Lutomirski <luto@kernel.org> w=
rote:
> On Thu, Jul 23, 2026 at 4:37=E2=80=AFAM Christian Brauner <brauner@kernel=
.org> wrote:
> >
> > Once entered, failfs is a throw-away-the-key moment. The task is
> > considered chrooted so it cannot create user namespaces to regain
> > CAP_SYS_CHROOT. chroot()/fchroot() back out require CAP_SYS_CHROOT.
>
> I kind of alluded to this earlier, but I don't think we should promise
> this.  In particular, I still think we should eventually allow a
> non-chrooted process with no_new_privs to chroot to any valid
> directory, and I think we should consider changing the definition of

FWIW, I kind of like that idea, but I think we need to look out for
how this interacts with path-based security checks and auditing.

Examples I can think of immediately are:

 - bpf_path_d_path() is intended for BPF LSMs that do
security/auditing, but uses d_path() which stops at the chroot.
 - audit_log_d_path() uses d_path()

These are already kinda broken in the face of unprivileged user
namespaces, but adding unprivileged arbitrary chroot() would break
them even more.
