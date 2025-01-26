Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4002513B59B
	for <linux-doc@vger.kernel.org>; Sun, 26 Jan 2025 14:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737900709; cv=none; b=h0cD+hTfMh0T4nOSGp3syEERc82uduAFs22L1ZGsaI05zPOmWsoMix9yT+WRRN5N7ZAyvtHQcqLf8jzJJUFONU9ekt4Udr2TtUoz62k5jAFi7ARzSp0GQol6qvodaz0ws1ZiXjrLwl3Om7g8GzBrQn7FeJ76eBZWbTXf533u10E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737900709; c=relaxed/simple;
	bh=12HzqKG7XNFsVb1EKgZbZZW8oeDZ1Bj4ACbSBWVyPFQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a6JG1+JPdFzsnwEbt6u87W77O6Dt7wLDkaOh+xzaPEBMc/qtP6Et9P8eXKCXiTKvgItIHI+bijKmvmo2DMY+9kMWsGEJXett7hgyj+0XhHfeWTk2mYKFu+CzrbwenjJSoxwoX+V4j/yCo68lwrN9I84IIJUEsb7KRitqFAFGFzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=YnG1MiVt; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="YnG1MiVt"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa679ad4265so924396866b.0
        for <linux-doc@vger.kernel.org>; Sun, 26 Jan 2025 06:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1737900704; x=1738505504; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=12HzqKG7XNFsVb1EKgZbZZW8oeDZ1Bj4ACbSBWVyPFQ=;
        b=YnG1MiVtxyeJ9r3CsHAYBUzy6KfIIQIxoxtPSVTXES1p+HdITODLJiD5QC+y5BSJ7d
         KajWhHTVVXt3IWoyhJ8lAxgZwcwvXxHWtiZjyk9hAfsgDsHCWnf2AJyUzVsiVVm8ZaTA
         uZGcoHiSLNZla1Hr1K0aaAwlQqCvVRYdzApWQPV6rruZmtA1LwXS/EYurf2Lad+YKPVw
         9Gvp5+vd1rT53HD98Ki9zy2uOttRweItmMIgYfU52AcABSQw1PGdFS5S/CGKP4VpOwxd
         xbD0L4A3d1yJZFead6dE2ueuMWMf2kS/dnJYZ+yytcM4ThQjrwoW3cUel0n/oEayl9k+
         YIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737900704; x=1738505504;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12HzqKG7XNFsVb1EKgZbZZW8oeDZ1Bj4ACbSBWVyPFQ=;
        b=CXOukQUYPR2LJArXpuXgR+adMio3LGLhS4cxYeC7i7Oe8fEJdKA+fiSNWIcvpEVVch
         uW5bSF7e9nOv62GYSXHUlaIKHsvkrhRPkp9tD88Nq0yYf4UvJ5TMgyoyP7IsH6rObe28
         pKp3+0VFrMpHGN8XmabiQx2gLDBHssbsNVazPVflu7vblO+F+DQ3Z6l90xCvRhgmnvC3
         WHReiIsCJGOFd+4EgOwrif0TsrpGqtj9uDERR/7+C2z9VU4MuoGX4FeP6iMlzoaNL3Ph
         tfLAzxGvCwQrc3u/G0JW1P+jSI/3BRuTqdAnD4bLUmbTQoTFjU8Uq5zs3xCat0F7bUKj
         v/2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVl+eNdN+apz691rK+w+z+PQXLfOQLbc/J4292id2ykghe9LJhJa/XDE8Os5ahVt02yFUfUDy1m8zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEtS7XyycHnYpbrrGOgh8dpthGVVcZsuc8/wLkiXru8HO/Fkhj
	Fhhgq/RqwWA63w+CY7FFP3QkJmrjvjtebz0orKWz0bFeTfgQBVOAKZS7tsqJTK8=
X-Gm-Gg: ASbGncuGobwkKB9DwF7/EQBX2fS34UXHqkxHjcIXAN7kiB92wfQSUPsG2pWFB7q83ay
	zbs7UIVSI/0Z2AwToDpVkj3aRCNHbbd41XS0wM33qROxc2eS0U0gyEYa8+VtaXCj7yq7FU/63CX
	P7bIs2Su0BFgOa5VhVsQRdg3I7AWysykb/6N3bdk7wFPl5ePbZNIkMVdkGEMav9RlWlNUgmrRpc
	hoGRe4sRmHcTQw1tQJ5B5rBTdZ+fNg6bRxCQ82D/7o+CyfKtH8F0rwC2aoupZmodC6uMGZ4NQ==
X-Google-Smtp-Source: AGHT+IEKSJdD2dRwqzzBvy9ISrqzwSE8h91lW/SaOjyNpZpNcIf5gT5KiPiOM2vkBbUPwNzHl+oUMQ==
X-Received: by 2002:a17:907:3206:b0:ab3:a4f6:7551 with SMTP id a640c23a62f3a-ab674600f00mr739626466b.13.1737900704480;
        Sun, 26 Jan 2025 06:11:44 -0800 (PST)
Received: from cloudflare.com ([2a09:bac5:506b:2432::39b:69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e64dc9sm420223466b.45.2025.01.26.06.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 06:11:43 -0800 (PST)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Jiayuan Chen <mrpre@163.com>
Cc: bpf@vger.kernel.org,  john.fastabend@gmail.com,  netdev@vger.kernel.org,
  martin.lau@linux.dev,  ast@kernel.org,  edumazet@google.com,
  davem@davemloft.net,  dsahern@kernel.org,  kuba@kernel.org,
  pabeni@redhat.com,  linux-kernel@vger.kernel.org,  song@kernel.org,
  andrii@kernel.org,  mhal@rbox.co,  yonghong.song@linux.dev,
  daniel@iogearbox.net,  xiyou.wangcong@gmail.com,  horms@kernel.org,
  corbet@lwn.net,  eddyz87@gmail.com,  cong.wang@bytedance.com,
  shuah@kernel.org,  mykolal@fb.com,  jolsa@kernel.org,  haoluo@google.com,
  sdf@fomichev.me,  kpsingh@kernel.org,  linux-doc@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v9 3/5] bpf: disable non stream socket for strparser
In-Reply-To: <20250122100917.49845-4-mrpre@163.com> (Jiayuan Chen's message of
	"Wed, 22 Jan 2025 18:09:15 +0800")
References: <20250122100917.49845-1-mrpre@163.com>
	<20250122100917.49845-4-mrpre@163.com>
Date: Sun, 26 Jan 2025 15:11:42 +0100
Message-ID: <87jzahd5r5.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 22, 2025 at 06:09 PM +08, Jiayuan Chen wrote:
> Currently, only TCP supports strparser, but sockmap doesn't intercept
> non-TCP connections to attach strparser. For example, with UDP, although
> the read/write handlers are replaced, strparser is not executed due to
> the lack of a read_sock operation.
>
> Furthermore, in udp_bpf_recvmsg(), it checks whether the psock has data,
> and if not, it falls back to the native UDP read interface, making
> UDP + strparser appear to read correctly. According to its commit history,
> this behavior is unexpected.
>
> Moreover, since UDP lacks the concept of streams, we intercept it directly.
>
> Fixes: 1fa1fe8ff161 ("bpf, sockmap: Test shutdown() correctly exits epoll and recv()=0")
> Signed-off-by: Jiayuan Chen <mrpre@163.com>
> ---

Acked-by: Jakub Sitnicki <jakub@cloudflare.com>
