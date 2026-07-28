Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1DA334C3D
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254044; cv=pass; b=QSTmS2tpp7OLgqUeUMPWd3gcf8wZjvgQKq96Tnp/ZEQ5WiKYGb/gEKb94OlSc+KlgB58aQJ6OJOWTVpnXEwBTvOb0n8WNM3WTSockKkYVi5D2x/Bg4AsECKPLSkZmndutfdOBMW2QVrN9XrbDYJHLO7oW5CPwZdaDHU4oaRzsEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254044; c=relaxed/simple;
	bh=VdgY403WdBNdk1xN9Bz16ZYD/M2uVC9qOnTtjXU5SSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vo2E4sUwZKD160m/JAAzxZnmZswyzaAb/BTDpTZ1N5xNDYH1yWKDm60WYXFAMS5m0Du5yxn5173nVGur2upemJpybNy+OfxAV0eh0/mPNjdWDZzLR6MH5q0OBtYN+eXw4BAkkn7pvTppXcEOfagMD8L29hd1kv6Wh8/6s3odGNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=xwSVATqO; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="xwSVATqO"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47de008b020so817931f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 08:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785254041; cv=none;
        d=google.com; s=arc-20260327;
        b=IuMAlHLEaRNxEDhhtFQbuUpLCqxU+0RO0dpVVI9wXcXPd/3xO7YFJyVJQXwXziW1Ht
         4PPKLdiuMdakn8gx7RSQdhgxtyEvPTnkvzzsYFc6qJlC73Pdy0Xe6tlslRNvuScC+898
         dXnzw75zQanpsxtl0MTdmCe7Z60Y9YGc65BVmTMUmHXqenwOVjWn4OYO9qJvjdmDLcb4
         B+VxNo9ofvUG25F+yzSB+jxT1ggNwgVrN9lodB1/krjZb64JgehXM45aYwY8hRlCW1N/
         /+giMhyIJIoNdvPx+Ae+seQEvpX3/7lnJwgOo121AcdmgOxsyuX+eE5nsM5sCzg3qeet
         EVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+U7EUowm/WpYWZVDDqRkyNBdiXnZeoZAf0Tk6pkUOwY=;
        fh=LpneHEXvQ7thiMUBSX5u+xZ8fwDBs84K6mBEuIY8CTo=;
        b=ltNjrUBXU8TfNwdb/D8PMfNXLXjk7kIeapWvv19jJJOr6ghktVYGCx5wyfL2Ey5Idl
         v8iTpp/AJx7KMXTFjqo/VONAlMfDlmNSgekhCu9zbLvD6Jnfts0BNDWzoPe1TUtWSKHg
         vsphWhVXIu1CvTX/rYbBRHfudWdG2OneJI0PyECmgfI9vbEVCDAjXf14I8YxkWS9sL6/
         fX5/ay5cvKA3r/EblWOgnpaXz7P5vIxCnXt7nYi3+q12p1PWOWhjFsy6vaKtqkcN6VOe
         uIci1ntPgk8CZxLzaY29WjXDtvg099V7ayLevhPiqCi+E5rKM1Z8Uc5onSCa2G/uamMY
         lyVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785254041; x=1785858841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+U7EUowm/WpYWZVDDqRkyNBdiXnZeoZAf0Tk6pkUOwY=;
        b=xwSVATqOIyzE+mwqBQHyrQ8C9WjxdeM53CK6wXHLMoUEjLfwdVeLsN4XB4zc7Mq8ny
         AaqMginj9jsqlmEyfu2b+II2F4z1YOaL9PHMG0M77KuUF1tIi/hilzXtvecOLtsSFBeN
         pTH/hRs+yeOc3uBx79ac4Nq+/zdvwdcwSoAqMrqK9NhkzJyOAiGCkwCcRSr6ZEAvbqlo
         oJPj47XipXNcR4jNCh+ZFV6YTwIC5dLjs25zYLvD7Hv7ql/zdOSR1jgLIF596t2RUj74
         znkTB6Lc9rorG3bi4SRl9BesHPrbF4FC0wtOqJJgydhj9UW7IoVzuesc4lZ3DsWoPW1e
         YrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785254041; x=1785858841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+U7EUowm/WpYWZVDDqRkyNBdiXnZeoZAf0Tk6pkUOwY=;
        b=bRPzKhEH9LTkoNC2zet838wTvmQ55vVo4PAR0t1UYzDzpyTHbRJPlcLb8UZkwpl96d
         UvPeUqApM989sOLdIdzacdjoFTZKfePfwWDEb1L4b/VxKvuvkkJ4AeD+n+ZjoIgwlE/s
         vwsfpOL65OnoOfbtmE9I9doth4OR9+ZrmXB20vH+m6MAnrtZV02DZRHPq2GtQbLBmUfI
         P11czjZjBb9U/A6O5cRd0WMGBq4D7CRjLcvG+DCTbqJcIi0W3TCnDMvlSO+KAxLhmQ8k
         wIoTx46CiqL/vyr008oVcx/BL9v2NUpnUGeTvttsidwJWzOTiVQVHvqycpxt9yk6LCwT
         L+Lg==
X-Forwarded-Encrypted: i=1; AHgh+RqaEqEMmUk2pXqtglIgZ5SAoqRmnFXAtFcqVNW7EHQeutJa5FMbEKN/WlhhpUHEt9y3Z0ETdIC8mts=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfKvYAY+ZRL2jqpIh686GArDbnWZoxSup3cU+Kpr4mqckXnRkZ
	ea2H6SGpqB9fBGTzdwSlTiSA4r2hxpSgRdyEpKnD/r7B9k+OWQW74qj1pzPtX55ZcPn3WKyVLl1
	ehHZ7O/yMh/INaTJEgNxxuImFmLlOvngAElZD6IKaZw==
X-Gm-Gg: AR+sD11p2W/HhoCGYPuRJeRasgA7/sMnElZfAta29DdEuOT/JhQfL+BS+RMyfqul9Vi
	3NxEdLiLGI+IL8fxxHg2nRQhcJ/8kc0bpVGjbhGQa944k2IfLQls0UkEAnhQTMyIVJ2PYEczenJ
	MVukK9YfPZODIR05NMJuRZtHYomq6VNA+ytYm4yCmlg2mx8+xQxTDoA8eRPhekt1fdenmbUik6P
	yXLkp/l8u4CY51yfXImLO0FjJF/rf6pUTQu6hpyFetzWzZ8ghYGzoISCusXh+6/d+8yNMMSo1kU
	Evwgxfk/I9MvAtu8BodMlhyPxlgbScZ78e8s3gleRCfi7lA5ZAbKAg2OsxRxUwP4YM0CdHhe7YQ
	joxu5SoswnYiQoWw=
X-Received: by 2002:a5d:5f51:0:b0:45e:dd32:92fa with SMTP id
 ffacd0b85a97d-47fb1e9992amr3932927f8f.12.1785254040632; Tue, 28 Jul 2026
 08:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709115610.287420-1-yhchen312@gmail.com>
In-Reply-To: <20260709115610.287420-1-yhchen312@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Jul 2026 21:23:49 +0530
X-Gm-Features: AUfX_mwzsyiunp_bPATfO_O8RiK5DjkNzGjCdX_kznFgbSWBNjYBF0Izm64N9aI
Message-ID: <CAAhSdy2r8Ei9ESdSJB8McC1T=Atp0yNa2MxEbOWNVRTUM_8YFA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control
 VS-mode WFI trapping
To: "Yuhang.chen" <yhchen312@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Quan Zhou <zhouquan@iscas.ac.cn>, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 5:26=E2=80=AFPM Yuhang.chen <yhchen312@gmail.com> wr=
ote:
>
> Add a kernel command-line option, kvm-riscv.wfi_trap_policy=3Dtrap|notrap=
,
> that controls whether a WFI executed by a VS-mode guest traps into KVM
> (HS-mode) or executes natively.
>
> Measured results (wfi_exit_stat delta / guest wake count over 3 s):
>
>   policy        WFI_EXITS   WAKE_CNT
>   ----------    ---------   --------
>   default       295         294      (=3D=3D trap, no regression)
>   trap          295         294
>   notrap          0         298
>
> Assisted-by: YuanSheng:deepseek-v4-pro
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Yuhang.chen <yhchen312@gmail.com>
> ---
>  .../admin-guide/kernel-parameters.txt         | 14 ++++++
>  arch/riscv/kvm/vcpu.c                         | 44 ++++++++++++++++++-
>  2 files changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index b5493a7f8f22..ee6603b30033 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3254,6 +3254,20 @@ Kernel parameters
>
>                         notrap: clear WFI instruction trap
>
> +       kvm-riscv.wfi_trap_policy=3D
> +                       [KVM,RISCV] Control when to set the WFI instructi=
on
> +                       trap for KVM VMs. When set, a VS-mode WFI traps i=
nto
> +                       KVM and is emulated; when clear, the guest execut=
es
> +                       WFI natively and blocks until a VS-mode interrupt
> +                       (e.g. the sstc timer) is pending.
> +
> +                       trap: set WFI instruction trap (HSTATUS.VTW=3D1)
> +
> +                       notrap: clear WFI instruction trap (HSTATUS.VTW=
=3D0)
> +
> +                       Defaults to trap, preserving the previous
> +                       unconditional behavior.
> +

This would mean that for the "notrap" policy the VCPU would never
sleep and increase host CPU utilization even when VCPU is idle.
Is this expected behaviour ?

Regards,
Anup
