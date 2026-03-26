Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10F53A75A4
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774509229; cv=pass; b=MSY3FTHi0PGQo10pCiavNy5nCXdLPkf8dPAGv0SDIWIASp2sTekP9JbP3RE/K6GNBClvFcL75DiWWjDF+/fOgHruXTYpOnr2Kgni4Tl8TwjF1mAmOJ8ergqpZYJ8+1Zcixv7jL+zzt7C3HnWakRMloiaZqwtOQjPWBt43a0BVbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774509229; c=relaxed/simple;
	bh=HVYIfY5RGVU5hE9Bo7jlxGQ00nzCfo4JVtwvFNTkonk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzM+zgX+RqyZSz5ubCugVr47Zt6j+5HcNNWAM9MxI9UizDftwuBG9vBcWoV/rxKG4pcmU5m1mvshV47GyoknauH6+lgHZkoRhBDGFGWrCQ1JaK/MEqz8NdyruOLadAPm/Mxaf+G4Mwz2rciC4GwJJAa829Mpo7fj4mp8px6SLbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaMcgFKE; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaMcgFKE"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66b0684f98eso378549a12.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 00:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774509226; cv=none;
        d=google.com; s=arc-20240605;
        b=b6VfdUKqgOYtaGIE4+JP/ERcOabZ27jFWB/E+E4iB2qprWXmsIgkX1EZ9docAjLDmU
         H46egG6OJPmMhzsvvijWw4mpeH0Eomp3GXNsg7H2c1EKkTtjPLGID+xgoCOZEo3Lw61p
         3MgF2vryNtYO2hO6qsTEFdFAIJG9nfd6/7KudvnGEJjQ3dWzd4iGemgzkCpb6aLOiHcM
         IoIbzKUf+n7YbvCBvKI35yNrmME5q//+eXW9u/1Mv1AnDWLdN5eHnG8Cxy0qQ2V4qAba
         oCBY7CwJkaAH7gDoJiNYZgInPQCr5Sa/IqrdTGagRNG5MjKoxWfYwQWAkO55Cc/7Tu5U
         Jw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HVYIfY5RGVU5hE9Bo7jlxGQ00nzCfo4JVtwvFNTkonk=;
        fh=tvvHN+2Wh4KECZLXbf/HqxJGHyHA8Ea0oawLd+hupVY=;
        b=esFWwkwP+qA5AFa5VQ196HAgkH4YTYm6Z2udycC5u28LYAEs9wg3QrXBOV2k2L91uc
         5IngCque3ZGuI8iv73HQQ+jRu0Jg+5m9KTcEItYuKIaRd0MJ01Ugu082Hcu4lu0bP3XM
         0x7/kZuEc+P8WORE8BvkoyV3wuZGMxGnV4as/ia1vwGnXVeoPPmIT/XFvE4iKYI9BxVa
         T4MY2PdoW8+EosiJQqVFnPOnRrpNQegS5OFerVh3R2feM1NY4g7nLNWPpDRyYa9S0MX5
         thtbol0bua6YUb2VVcRco8yoW3EFoxjtC9vmvL9+Q0w9f9UWQJHV6N+kY8OUcVKY1JQJ
         bCqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774509226; x=1775114026; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HVYIfY5RGVU5hE9Bo7jlxGQ00nzCfo4JVtwvFNTkonk=;
        b=DaMcgFKEQzwzVn+3dRyxTXKcyFW7z30x2q4rTZ7DbPyAugOhW/hNCJfC/X/RC4m+qR
         qT7JYCFLdmrPHAcqaEClNtfz4zCNCafSsTx7kVaqU8NJGnFq51SmFzJqRIKAdoBPZNWd
         gUNVkACr8KWXewOfFgVaGLKDWNh5JQhSLFtuhPhPXENFa7oc8p9XvYRKJTjV5hQwVxwh
         jqPWpzXPvbsluzNjwluQ3YaalOyxWZFlkU2ii3hH9T8M6s3ihDQ465b+v8eQgYws2UnT
         yonjt8cQvnlecQd3ZaSxO71XqUaLs21lT2gIjNPWxXCf41KB8ID1w2oi53fI9GyatG8R
         ZQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774509226; x=1775114026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVYIfY5RGVU5hE9Bo7jlxGQ00nzCfo4JVtwvFNTkonk=;
        b=rzKJ1rJmYOGAtmB2yYctzDeZ64Tb4M5QCUCLNx4DmzbBJYu0nHdxtBPLhRtuvn/Vqn
         AGeeq49nKa4x17s7Sb06EqT0vSmJp5mRL5f+5u/qM40GPeUCtaKjTVOSu2zyIU/TOHFQ
         s23hyac8LGnKIdB4MdKGcfFarXdBAS+4POjsU60vv67j8cpBKIevK/jz6SeCagVgV+Hq
         ZFKbYoMSb6zW6wp5zMwQN/jSydpkjIMimSPkCKo6+u8y0bHyJ6MOk/eN5SPCfdrdlWwQ
         K5zS44Fjvw6Y/4reOvj8iNOPepnF5TqSRaxWUqgZ5MOfXGKgzInlK0DJmxd6zqBMViFM
         bjUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9bRySrcBdc8mWhBg1iZ7lGqdC73h26fVf0WeJGmknsx+d/+WOLXBEG2IZ6OiqMggqF1p+ULi2K2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqIVQOnTf9Go+yg7T0c0fiMYyMbHiclmsuKG58jrcFr+xUmSDD
	Fdkn4Aff4A5ijP2ht+neKQBJOl0a3yEtIJ/JlQBlmSZZs05S/UrOhxNgJJBUNJiabVai6IrBHF9
	O6kbhTu067YDyHHAO5wk/zDBONSjZHG8=
X-Gm-Gg: ATEYQzxjyDvkPhU5vebieESiwchWceu9mMn6gfDwdpo/ANgCaTOrTeHrDFM961yeV3x
	Gy1h+xr2sq61nvEUAhsIjbJqsoBBc9EdshY3Hr2WPYtGHqWibwgXdOUsZm45erd9HJ2ZAdQUMxs
	mvOi91XVgcbFph5SEFNcm7V6kwQywqkDbhmp2apPM/1ZrsiCwM5roOHUvxNGYLxZaSXt7QGVU67
	vU6DcTZeM/dLJBYrejifMg4CMCkOVQwuwuGzC2COX8R0F9K4qdoTAUii1RHoC5DSuc4E/kE7GtL
	W2+akg==
X-Received: by 2002:a05:6402:35c7:b0:663:56c4:2dc9 with SMTP id
 4fb4d7f45d1cf-66a826a164amr4266656a12.16.1774509225926; Thu, 26 Mar 2026
 00:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1774403912-210670-1-git-send-email-shawn.lin@rock-chips.com> <1774403912-210670-4-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1774403912-210670-4-git-send-email-shawn.lin@rock-chips.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 26 Mar 2026 12:43:29 +0530
X-Gm-Features: AQROBzDOhjtwDHUqjyR7aLHKrElwwWK5j8GxED5sK_-NhNXgE0WUA3wwNc4lR-Q
Message-ID: <CANAwSgSwKt04OYX4ckkMu+iRm2D8BFp9FpjRWUh=5ad77dErqw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] PCI: dw-rockchip: Add pcie_ltssm_state_transition
 trace support
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"

Hi Shawn,

On Wed, 25 Mar 2026 at 07:29, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> Rockchip platforms provide a 64x4 bytes debug FIFO to trace the
> LTSSM history. Any LTSSM change will be recorded. It's useful
> for debug purpose, for example link failure, etc.
>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
