Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F9232ED27
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 05:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780292686; cv=pass; b=O/6BFNMIrjxN1u8dbLJFRWCdPxJsZUI037ZkfD69tX1YDdyeq8GtXFy+OqIu29uuQs+vuP6KnbD69IgEDrEhj6dTVPn/Rh27QhCN7LLgLS0qDbWZb6tUoHhCLRGzZy+0dtqAU26+yRFDgZZMEK35FwmACQ2EohVVx5Tsh4dHNKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780292686; c=relaxed/simple;
	bh=3SEfUrGpOB+OrS2N/tF2ctbW+WT/uZ3USk5VMcVSXLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5YwOVoATuMIypC0AIEyOL1IcXYAOO/as+bFn0PsF9ka+f73zYMXcMUFFnh+aE6ahDPB/xRDG9FtdqMFLCTatgnJhriIEfkJoktxZC5bcQAXuF0GyXNOp6ZxpWeAY2GV+p7/qfsZEMQxh/tyR3sTULyBKaE91QqZWTNllBPIi+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eFcOPSmy; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eFcOPSmy"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5174a1f2d45so5100621cf.3
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 22:44:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780292685; cv=none;
        d=google.com; s=arc-20240605;
        b=OI/UjTZpxAroyHVqE7dYY8281MQ9ipNUgOeBY75SCUiu6wWA/LtWk9ZfIum0/CJNxB
         DgfIXUZHCMJGvDFAbqFV4fXh7Q+9FaI0Cjpci2pYEeuUQ5eLzlzKSOqJCb8B8JLK98yA
         EVn+6LolJEe60hRq+SuGheQfmsbmjIgFYJvbzKStn8kILchfQ4mVopisz0uQsOGakVHm
         dgYpfEb54bs/gmszKl/ia9sUjVs9k38m28d/GgdGGV4yF7mdPsQhtfhxduj8Hb3Rwyeg
         UnrMmGjB9hlDoURh0/WdFBxpSUW1H9dq/qQsvxlobM/+QqcRcAIw58GgFyyqwTXFpvEm
         qtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CYJ9us5FFWuw1Ubnqm5Mv6Rgk1trKuije/O9oTp1I54=;
        fh=JAlUtUtFhZVIhEQuegZdzzmC+T2DD4dmbXGiQ99D60s=;
        b=Q1t7JIVCzWNcpkRFvueH5ci014oRB7oPfSMk1aeIaajEwuq4TNWvPNkuhsJZKKDzGh
         SmLPzoBFoYKm54zjTCXL9uDaTqW0SUGYzDaTABAtrlEytxfE8WHRLru8WoRpCu/zK7Pt
         Zx2t395wxAzUD5TrLTqvhV1Sx+Da2Cl+teVJuaGq4sB7ukT3eApzsKs2KqZW0OxVVoR6
         xi9JxlZg9noWyMDpLEJlRel0x5J+ZRp8YnNvysjKU2M0fdhfgSx8nilQyIqllF+MiHn0
         u4hzsPmjOd0d2GTdBZ4vodwx9iRjd+CVa2qpryJ1W0994YG9iYS1YBQe8hbV0W9AYcKp
         QPCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780292685; x=1780897485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYJ9us5FFWuw1Ubnqm5Mv6Rgk1trKuije/O9oTp1I54=;
        b=eFcOPSmysNRzKMC/dOMYuTqrR/SkhfUf3KOewI+3rMotMkgegMaWjLmmj7N0Iab4Fo
         cdEoxnqvSeJupxVKd0Wp+ggTpbzz8lIyxUQhcnGTG7dzt8PP3OJGwWzM01wIpCtQt5ST
         e501O7hVBPRYiHXcLP2oQvVdXNfBD9WZ40IKM+c5s9CFiziKQnO+jzB78bOespbTdyEY
         ocsHHaigV7i6t7ihlqzMLoUopjgWfqQjAN1ObeV0pzrKAnl30ZqKwBMWHU06EzTl2Cct
         CBgeGgjAyCfOgLKWbqBhK1CGzunskMda2fgA8yKeRXZkjGz8I0rG7cGJtNIjJQm6xAqY
         qb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780292685; x=1780897485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CYJ9us5FFWuw1Ubnqm5Mv6Rgk1trKuije/O9oTp1I54=;
        b=EQHOd5VubZYXlLcjZph//noaloOokWkvYFpwcc/fBb3dJtycF7CzddbhpLjVC/NK7o
         k6QJlVlIOWzmi+qpcfdsVVUeb96eVuoVTlli31YL6WuvIXclsUOylsFFVkW3cW1ReVh1
         T31NI1rOsJQzMWVvDzzHXpPEUT8H27TqN9FEyQ9wp80LOUBRQk9qchbU4nwJpQ+aCf5n
         vywBjRAx1E24L1eC6vla9mM6BoSYN0ia9Kh/s0QX82YjGQF626SvI/FwfgmKj2vnlkr0
         AIXEt3/K432z4f5sr7aYpwh+7egMfsRcy8vE04DSl8xjCjkEdp1eTIPcFYTcJ48lR7WY
         1I0A==
X-Forwarded-Encrypted: i=1; AFNElJ/BH1mkP6iC/ZE+iAOuqD7WGNOaAKJSq/GiINHlMCrJcMFuZJAWybvm1JAYYBqC0LxOibJCRs1yH64=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybf3Iswew7z9BX91fEsqh1TJTKCrzHhrOH829r1fFUCmDjM0C0
	JVKsT457aIE6coYumPasCCZFuxbvaiGokwjhJmEWV0wmIUsIHgNH+rO4MsmRiMbXnJJ+LJha9Z0
	2O5OorHesL4f2vywO2aQ0f6DdXEtF7m2UhBn7j9d3P7Tf/6O/PIOCxHTb
X-Gm-Gg: Acq92OHrJOuz2me2P++MxH5G9e+ZD6ePnlYzDs7IFB4Hj5zqqznPhmj9PHnkqFydlff
	bVS7zH4+/mB6QHUBoH/9k0DPoUwsiFUVd7yLPTDtnitbPgS4QMWXTP4hASmm7Q9zqdxsPR8epcz
	iw7V1F12fcMOUd6k1zlRB3tC6kH/f03mgT+la2hx1p93XDNK7McQHFUX/7Qr/WT5voOUiVGoJN2
	8gHSYuABxMtRYISn2yvSuuMU1O1cQq7uYEFdaenCFwArijYZZMvYDl0w8g90ktDn1qSbUKqK/tw
	9pJmLabDwe0fVfO+OwBFoN+WyDXhY+2zggesH8C0UJCEBV6xEk3dkJYPKT1YLao+5XkxipDZ4ih
	huxZPkGP9idXH9ac2TpiYS5PTRM2/
X-Received: by 2002:a05:622a:1106:b0:517:5790:ff7b with SMTP id
 d75a77b69052e-51757910b7amr22711931cf.57.1780292684284; Sun, 31 May 2026
 22:44:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-net-next-mptcp-add-addr6-port-ts-v1-0-4fc25dfef62e@kernel.org>
 <20260601-net-next-mptcp-add-addr6-port-ts-v1-4-4fc25dfef62e@kernel.org>
In-Reply-To: <20260601-net-next-mptcp-add-addr6-port-ts-v1-4-4fc25dfef62e@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 31 May 2026 22:44:32 -0700
X-Gm-Features: AVHnY4IayHyy6cMDi-nQDDjXrYJHGRD4C69UxZMSkBfLGuSFxlZymzrG3JPQpdU
Message-ID: <CANn89iL=os-60kDKqMDdyiXuPF5CG=eejS0vmthwpDGXz_Bp8A@mail.gmail.com>
Subject: Re: [PATCH net-next 04/11] mptcp: introduce add_addr_v6_port_drop_ts
 sysctl knob
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, mptcp@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 10:24=E2=80=AFPM Matthieu Baerts (NGI0)
<matttbe@kernel.org> wrote:
>
> This sysctl is going to be used in the next commits to drop TCP
> timestamps option, to be able to send an ADD_ADDR with a v6 IP address
> and a port number. It is enabled by default.
>
> This knob is explicitly disabled in the MPTCP Join selftest, with the
> "signal addr list progresses after tx drop" subtest, to continue
> verifying the previous behaviour where the ADD_ADDR is not sent due to a
> lack of space.
>
> While at it, move syn_retrans_before_tcp_fallback down from struct
> mptcp_pernet, to avoid creating another 3 bytes hole.
>
> Reviewed-by: Mat Martineau <martineau@kernel.org>
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>

...

>  };
> @@ -94,6 +95,11 @@ const char *mptcp_get_scheduler(const struct net *net)
>         return mptcp_get_pernet(net)->scheduler;
>  }
>
> +unsigned int mptcp_add_addr_v6_port_drop_ts(const struct net *net)
> +{
> +       return mptcp_get_pernet(net)->add_addr_v6_port_drop_ts;
> +}

Please use READ_ONCE() over sysctls.
This will avoid future patches from KCSAN bots.
