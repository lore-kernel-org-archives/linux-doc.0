Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A19637AA9F
	for <linux-doc@vger.kernel.org>; Sat,  8 Aug 2026 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786183144; cv=none; b=snmbl28WhyonmpmZzB+1P+VQnkSpxD3tizcTAP/0tCkUP3RPKTZ2DVhgybqOU/kTP/W9E2BbNBPf2RBtYrn8YGfpXGi4h2s4QXXfnHbGYzTOjsvjH69Nr0cZTrS02FIGQkmIhAw+kOD6ppH+Age8/34iMX4I98jrQxpAhrjSoMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786183144; c=relaxed/simple;
	bh=W0eW/ZasrcB2H3LJL+03kv0ucwEjc0ZwxAGacASR04w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skVcrFloNx3IUhlJzDne5rB3AwHFJDwUMmD4oMXb1Uq8LUQZ86IZGF0EwN1AYB3/5ov0aa5FKhu3OW64XBgze19cJ3ShP0YiR9isNZC/BUydxQOPwg9GUAAsCLrV1jYg9FJgawjKAJFT1U/mIi6+KgwPiE8aUIFmpetXJLbnHr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=IbduS9jn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="IbduS9jn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so3665235e9.2
        for <linux-doc@vger.kernel.org>; Sat, 08 Aug 2026 02:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1786183139; x=1786787939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hr4rNoSGp4NHIekFunzyCDZp2DX3uWJ4HIovEA2xeO4=;
        b=IbduS9jnB2UahRDtFzqXuVcSkf1SQSDTZ77nciPUlfptm3qzygluDCSQTBKEDvPzeq
         8k77tza2nOc+9xrHVicwmDQHirDKLznbzGF6HCD9Z3uoK9gKk2J1v3Km9eIeAJaxoqM3
         dEIUp/Vub+Vbp/H0Ir3zZtrVfOLuoEOWhwPhyEL9wEAcwEtKnLVkWc1ARNNxb3/B+SpK
         u/4D5tdCc2hU2FTWTMCfjl/GhKtYajTCooy0QuevtdQ0QVGwroJmTgNXdwymbm5VpNBv
         w9WRXk0ERb5Fypm8J0hgmO9E6CR/nsr0svpCMAMdh//ROUH6WXvEOMRlAk9zvNwDssVU
         X3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786183139; x=1786787939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hr4rNoSGp4NHIekFunzyCDZp2DX3uWJ4HIovEA2xeO4=;
        b=DhRmT1nIISZuxowGRMp2yReN6t576dYwKUqump2Tl/Y81So1hGr2dManymV0+KrUrT
         k+QOjiUurKXu8G2OLT6CU+47YI70yYvyZh6UUzHoqBH2CWocITCG0iPiTF0olxfiufDp
         YE91dEoYupFkz/KDGpfEdqN6vd4cbdWkiWMnlUx96U5agmYf/nsin5nIezSO6HuT73js
         7+MqBYbh/o68356giexdhi7b16Tv/pzE6g9Eau/Y3f5QC+B6Ql6+Xhe7gkR3zvFZtFfA
         rv8fB5RZdt85v8zqcdmZuDW8e5C7TVWPbAv/agYrmXnK0pKVrR+61hLCQ6+K54vHx+X3
         yqHA==
X-Forwarded-Encrypted: i=1; AHgh+Rpwp1SFm8WMMi2N6oNRvXDSbLIVfjpD4LHKsui5+zJFbjKitJ0hHOmHH+zVuk8D/5ft7YCUKk05qTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvxjU+sJkeeg2laQbNez9pkDEkGlOHh+79inNNK7DChLl7gvE2
	MwOnNkWlrMBIoaTNz8ssBtHFxWC7vsStUgiWcUIlPDkNCBoPDRTStKGwcZqtnnBafP0=
X-Gm-Gg: AR+sD11ND+q9Gq/MlpTqZm/xl64C7nwENgNn6WOVc8GnLztbPK/b50frWkW9+2b60B3
	676ENvuf7zPPBKyKjMJB6veMw0YD6wIwdBrx7Nck2rCYGIU8XhFL3NbyBLmLpyuVQFVT/pbxJzc
	mDYy+V5I68R8C7QCbQaH6YVH/25mG4Zi8nHp73R8ebqnmjBJEqtPXQZUAMOfEtrukCIatRGrQJO
	0EURm0rSybRHjtO9dzQABtoaGZdD83OwzttO+WARc6S+wHj3I5aQ1RQxPVB2XlBn0JluaF2iC4w
	2hlfewBnbtCvMyRchVYEkRKQPjWyaBjK8HYajKBnTjNWXhRzD5DopXPhVxD8uCJJXxueRsUBKXS
	7+wsXn2tnkhsO/sSQJnZeuMHBPXqTgrjRp7cEYDpz321TZr0/PpGT2jo/MqCLTxvaBO0Vd/DbNa
	ipEIryn/0TEyxTMqMO+zMnIHKWodU3kcZb2rY/La1DyhbU0KsiFijEeAEV8r8o2W89kHdpq6KsH
	6vVEW17FTgU+eBNHhc5
X-Received: by 2002:a05:600c:3b04:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-49959e016f2mr204095965e9.3.1786183138873;
        Sat, 08 Aug 2026 02:58:58 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea2dc4esm123249915e9.13.2026.08.08.02.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:58:58 -0700 (PDT)
Date: Sat, 8 Aug 2026 11:58:54 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jakub Kicinski <kuba@kernel.org>, Min Li <min.li@microchip.com>, 
	Paolo Abeni <pabeni@redhat.com>, Petr Oros <poros@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/2] dpll: use pin owner's dpll ref for
 pin-level attribute setting
Message-ID: <anb91_uhQWVz_oMh@FV6GYCPJ69>
References: <20260807095926.386923-1-ivecera@redhat.com>
 <20260807095926.386923-3-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807095926.386923-3-ivecera@redhat.com>

Fri, Aug 07, 2026 at 11:59:26AM +0200, ivecera@redhat.com wrote:
>Pin-level attributes (frequency, phase adjust, embedded sync, reference
>sync) are properties of the pin itself, not of a particular DPLL device.
>The get callbacks already use only the pin owner's DPLL reference
>(via dpll_pin_own_dpll_ref_first()), but the set callbacks iterate over
>all registered DPLL references and invoke the set operation on each one.
>
>This is redundant because a pin is a single physical entity - setting
>its frequency or phase adjust once through the owner's ops is sufficient.
>Calling set on every registered DPLL just results in duplicate HW writes
>for drivers that share a pin across multiple DPLL devices (e.g. ice
>registers each input pin with both the EEC and PPS DPLL, zl3073x
>registers input pins with every DPLL channel).
>
>Simplify dpll_pin_freq_set(), dpll_pin_esync_set(),
>dpll_pin_ref_sync_state_set() and dpll_pin_phase_adj_set() to call the
>set callback only through the owner's DPLL reference, matching the
>existing get-side behavior. This removes the xa_for_each iteration
>loops, the now-unnecessary rollback logic, and several local variables.
>
>The -EOPNOTSUPP validation loop, which checked ops support across all
>owner-matching references, is replaced with a direct check on the
>single owner reference returned by dpll_pin_own_dpll_ref_first().
>
>The documentation in dpll.rst is updated to reflect that pin-level
>attributes are set through the pin owner's dpll reference only.
>
>No existing driver is affected:
>  - ptp_ocp and mlx5 register each pin with a single DPLL.
>  - ice registers input pins with two DPLLs (EEC and PPS) using
>    identical ops and pin_priv; the set callbacks address the HW by
>    pin index, not by DPLL, so the second call was a no-op.
>  - zl3073x registers input pins with every DPLL channel; the set
>    callbacks address HW by pin/ref ID regardless of DPLL. The
>    ref_sync_set callback was the only one with per-channel behavior,
>    addressed by the preceding patch.
>
>Signed-off-by: Ivan Vecera <ivecera@redhat.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
