Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADA8470117
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 06:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046500; cv=pass; b=ULcv733XyzaxwL72mh67woy6sSlm3mq4Ju3Bwhv6LiGvrxPtVwWdohOX8Hp2DIcYg2lyaNIp1o1U/FAIyqEFpz6rISPYspBjGeusLwclwyjE4d/78Tde2m8HwFa+Ig1p562+h40mPV60AGECN9YjJYIubboMMQz1qFFWn4NE2io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046500; c=relaxed/simple;
	bh=MrFGI1be76pYyB9TL6I9wBqjO1kJCs3f0U+Fi8vpDZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pq20BUr/wRWIGREuTHfNV/b6KmMXcJoxL1k+StOukESj76U1kJi9hfOfRupZWMFmFf3bEpWWudRzegcB7oK2QHZ7UbZrfGuWXpTQkJOyQxRCqkqON4LU7wY6hedzjy+NexeEtkv4gufG5t2Ys0yt1pkt0PtSXhKLo/b/PPyQQbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9mUXX//; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9mUXX//"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3584f70a5aaso650164eec.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 23:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792046498; cv=none;
        d=google.com; s=arc-20260327;
        b=eidOVqeU2f+as6svcRE+Ebqpp1tL3hX1jbquldBmfhmefODcWH0j/giTGevTtcl5nA
         mmp3dFAx/9SjFRKJJ6QIsuL0eEritRATPDq69gyF/GECbu3PldpamsdfO6AsHyEwdT3k
         YYcENCd2N6G+kPv3QH+uamKln9RQBUjSvg1y2S4Hgrloi+2pGVgH8O7TjbWBCGsVRpXo
         oaEjvkAUassaTX5PLNnDfOhJsYRq+3fRNeYgT0H9V87vXLQvSyESJGRYU8XPrQL3wSvN
         LOUN9R2zcBB8T4FfyTE3ocTzqdGqYlI8IXVM3h8jRbEhHjqZ9sW5fhAXKwvU5q5b7sMC
         4QHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9odSnvYCtr0sGptAX/xIcYUrhmINaRR4pN3Qm6Y4SjU=;
        fh=xxdZ0oHDSp3NnqBtMHDywJWVmOD2F756Bed2nTcVFro=;
        b=fpobMz3MA6DVxUDXnCzoY1yQOJ4wd+Y423Yq/ZkLcP5yN6XoClED09C6nACQYjtsnA
         MNwlAktt+2PJ9MY6McmrOB3zepMgYvE93LbfbottIi8qbdwV37VCzRYsdpQ9atTD99SA
         8PHBfgD4pja6eSJyE9c/5OyV/yKnp4j/kitHwDmIihZ2yIyDvlaNrDQxKNEbgzhhwiit
         TQiuOjGpWl5MXQbmn6myOI0+viRLys4K+kpX7XIPPLbMySZkHDU1z06u0iFCnuWsCQL+
         VBE1o81UBe1tfFr9LWYJhZ068T1HEP4ONkOfB+IkBqDfeAwYl/YyiDM1MVwTEYgU3hBA
         2tgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792046498; x=1792651298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9odSnvYCtr0sGptAX/xIcYUrhmINaRR4pN3Qm6Y4SjU=;
        b=d9mUXX//0M3BTdGknxyw62CeTj5V3Y/5LN9YHt24xbjmuhkd0YFUzgB+euNwwpZXey
         +uSWeXhLWol1IEM6gbxUQ2Q9idIdeXmwgIcSbyBqkakMBNGLzvn5LD4FQkJ1ks8IZgy3
         5lzIkaEDc8BfgLo2yHGw0alXY8BWi9NNcp3Z+9Npb0k6HhOF/uXcLFWNstTExJVndfcC
         0+2oAP+XV7nnlVAfa6wF3UgClnx0o3Sm+EwS0pxPDYRyIt1oypzVnDBtVxWnZGv0glID
         pP93teQk6cc3c7XBr+ipgP94/ooGaUFCcZUGvKUl1wKu9nX612K4vhh/vBH0wzksFgVQ
         r+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792046498; x=1792651298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9odSnvYCtr0sGptAX/xIcYUrhmINaRR4pN3Qm6Y4SjU=;
        b=kNoMorO+7NGBJepDz6bjzeNcl9TuVryACLZIwrAkY97+XeVfUrHowXM4s67KHTht2s
         Y+3rX6vvNpqvDsFnkrXE0I1RuKSRyne0AQ0gDEWD1WhUeW4YlKiXTDc3aifd1y1vR0Na
         Dtt4cjMgVToy7IAADGH872eJoypXSb4j+OEP5V52MNWJlojc5EjkEAv975qqpT0rXAVz
         TA4p9eIFvyUvk+Z52G5ajsHEtSba+tl+wEMJTIAFj5VnIJ5krC+nYgGIc6wXJ7F7K+x5
         cy+FRApzgtpffdeWIWT9IVfYlu7j/tAOJmCadn+W1U5PJEicjp0NtpneyWWHfm4/odTu
         A5XA==
X-Forwarded-Encrypted: i=1; AKwUvBxETPfUj1XY9kHChxisgal6RtTK9Kerwqb/BlY+5qwN4DU8OpEtU4fQAGNC7LStXYSGws8Fi6eeO9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI76ezTmvTVsPCskSDE16WWwTmyp5GPekafzHfIqfmTcIGXE0ip
	IbvJFpwzSlqwrwLbODM6/GK4eAZ2r1GwWe8m/5JDqTko2FT+yzWdvnsL8rRTzXFldvpliXnzB8I
	JUIEeSdmxCf8hbrFaFt/D9POHt4cpuc0=
X-Gm-Gg: AYBFou0ekV5Ue6XEJR+MgQg/C3U3487LrKPp7NXGsaPHyg8t+hfI3ic9HoB7DOwMumI
	ipjWBodulNdB0bOmfMx0M7oEUwR2edzZvF7mVmxtA9lPAiasIo1OUjWJEkhW8OQ82OOtSAOlId1
	WjxbXERhjoeMa4DAqSFauhqhTHocmzodH0xJHrgiWHQYI408JJfu/3xDGl9MebpFwFJE1tfmXTj
	NhEGMCSra4uLwpQrhB8LCxXvAfg8iXHJuZnchzRab1BzrIORcEwFNbyZiMWPtX65PAWTx10Fqtg
	Ftpd5FyIABysmec+6LrUUpzIM6B9+QdtTcwinwocRPh7FbSfL6L8zBWfgSzrqRkRRkt5NZgK5FW
	TjlI1VrP/atxtA3UBjQaPwrpirpY/hnh8DsGQ6+xf9I+EhIUNKrz1ENbgCte1FdIDL5ODVLcZ65
	uaBXkEoWQNbdu6CjJuTE4FXorAhTR/loDbYDFcnPYhuS60+S2ii5c=
X-Received: by 2002:a05:7300:8a9a:b0:35f:8c5d:5938 with SMTP id
 5a478bee46e88-35f8c5d5b04mr947891eec.1.1792046497624; Wed, 14 Oct 2026
 23:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
In-Reply-To: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 08:41:24 +0200
X-Gm-Features: AclHuK_HDQ14xS71Ad82_rpzYIJtkQyGIN6gdAVSfUGhxccboCyKadyvvVMRcI0
Message-ID: <CANiq72mu5nS89cxFQ8c8k+URcqfSCGLJ0d8xW3k0Gp-fMeVWLQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
To: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:08=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> From: Danilo Krummrich <dakr@kernel.org>
>
> system_wq is deprecated and triggers a runtime warning:
>
>         [    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7=
_ enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Replace system() with system_percpu() and system_dfl(), to match the
> previous behavior of the deprecated system() and convert doc examples
> and tests to system_dfl().
>
> system_unbound_wq is deprecated in the same way, in favor of
> system_dfl_wq. Since system_unbound() has no users, just remove it as
> well.
>
> Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unb=
ound}_wq is used")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Happy to pick it up if workqueue is OK with it.

Cheers,
Miguel
