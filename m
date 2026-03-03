Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DB031F9B8
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 21:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572722; cv=pass; b=T7dycXTxIPwIeoJNy0jWXEYQ01LQ0tR81sldwOIDxmb8T9k4SL5fIOe77XeaW/s+SivFMN+lRlDHBdA6bqCsuesUSc6Lq6/GmXq3fIFsxJ3fP9SWqCj4VRQZYYRNFk4u4iCirMMrhm94KD9W51mzh96xAr5xWRoVkVb8xiwWBY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572722; c=relaxed/simple;
	bh=kqBekaqTLUTuIqVLl/Xn32stOU/skKJREqaiqK/UiSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNkagcQWAImTvU3gaL1CWN5iUR/RJ+49N/CGY7xThvuqLgsogdpnrid5H8gWur3z7SmcZ3IrmRnUxGbdfF8D6z8pk8KXU3Mgs4zP7WHRDqZKMfKXkOJVH+VuXPdo+oHGAOcKP1Pcaz4GRahPoMhszRINSj1/TjB1axIHlp7fCQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1I12xVRm; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1I12xVRm"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1277d379936so7371291c88.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 13:18:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772572720; cv=none;
        d=google.com; s=arc-20240605;
        b=AF6rJXYI8AB0E8qOUKlPevkUaDHvP2azGE1dGgZkoI9V4eX0sD8B4N0K3RB4uLO4bp
         Vim3hfsA+F5UWGOOpK10T2gfZlc9IsTBoJ8vWBgF8oNlv94Pscmrjs7j0klaHxad6nLd
         4a9nPpTKQO0Lhy5HWAB4O0nsJy7WaF+7YPH77zjL6b0slhDKlKbSsWO+Ia8B8OidhUYw
         NFxoPWp8yfwz7owzsSGF4hVHYTSYTy4AMQRFreoXMHB/vSpjHm1OZuF/2zzl2JDbGLnm
         4hDeF/I8pK97/vcAciGJAsGrsehBr5g/S/HeT3BJEcp+WFEldc6qJ0cqmJeUyfUPauq3
         2+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kqBekaqTLUTuIqVLl/Xn32stOU/skKJREqaiqK/UiSk=;
        fh=0PuKDZqixqtlSLWU/np22csbv36LB4l3/0r/G9argy0=;
        b=Ok7HqUD95tcnlWvpl14bsf6Nry5XrohPq+R+BOcmVmtigXy3Ligc3+mUZ/skfpp0ec
         gvCBYK1NeIvBoUQpdzSoJ0UwrimOgNNyRH6P0Bl40Goxyqe/tPvT1QjGAvq+3JOv51ix
         xH4UkcmE3bmkBvM1nvQOD6dP8X52Q1HZx6/HYdMXKUOGnVxHGIakhFh8o/sskvx07TTV
         NBjnf3twAc+fnFInIibNDdsrPGKFmxTfJ+VhYOSboGF9Cz7WWWly6U8iLa9zpphqsXYm
         u8O73tCjdfkxgfNBdhAtNUmRx8bcFc0VtOBuN9kLoZdRTJ/ZtO2vxpgzUTDOGlJLOPer
         tvYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772572720; x=1773177520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqBekaqTLUTuIqVLl/Xn32stOU/skKJREqaiqK/UiSk=;
        b=1I12xVRmn9uobgGaWVjr9pwNSbKzIKJdprYqNuuPOWwmJ0FRvmg9dxPWqjnl+rJaZu
         Zq1trqIDdyLl1qt6N9zdQiBESsoBD5BhsMntKLIgt2G+LrmTehl2Opu1LoW/YeEMPtr/
         szYM408h1lxFhK46Ydg75MmVd8DX6HugvDgt6M/eWlfMWAJ9C1bEnduKaoy99nXWJiVk
         EHlNVduPZQAiHlsOUYL0fL1FYp0CumscV6f+Y6u9ATv13fWW9JqSdVMjLF/Ap+i8KfYC
         4zaiD4j0WtDkVJpdZE8dAXoww6YhBiRMRQ/0YScHz09mK8SuUxobl67S95ZtmJUz+QxO
         ++mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572720; x=1773177520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kqBekaqTLUTuIqVLl/Xn32stOU/skKJREqaiqK/UiSk=;
        b=qZh8QezRoxdPO1OA5fvQbFwvc0d8eqa6r1O0xcX5UT5WL7TBdE6S9hHtdEpw1awALU
         LgSILwuFijeUeb4ksql+96tC0TouT1VWTUvkCcdPUk6Rk6bEkEOsBzWLPSDErfrdUzOG
         9rY+a9oyTjcvu7kbQaAP+bC2Y/NvFxud1mlyEu8wglPfd174HmK+5vHhUSzQ+t3wT0Uh
         oxNiLHB2QeoDqAR5u741blPO9HyjVn5rgyY69+k+QiwGH1MLO36uCIrxAFy44deBBThQ
         L840qvCHKlXkXi54jUIMWXi5s7mKkQm1S39FaqZWoMoWlUV/Tau53W0xpo4dUdqioad3
         jVLg==
X-Forwarded-Encrypted: i=1; AJvYcCU40GyjmkbJ3n/mlSz3Y6RKIYJeLHw9VEd5jG5bDV640Cn2s8pNnd6VEDsACWyCyfKyOLKifovab0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YybNtLPETvpy5CqSWfsl6UOevoVcf8G0ynmBa1hhWPIFdqdjGXd
	/NAnPvzLiKrAMsHIGSElv+tVLLIHVKV8gyESabDVChBRJxlplWdmNhAyejbLetE780vqEulLkVy
	zUudYO6rlM9mkEaNf2gw1cHGvjehYJCn1KoXA8wCO
X-Gm-Gg: ATEYQzxsl5lemUUQ4+ifvFyd6ADaroS+4CXWITq8B6B8RNy8Qlp5x0aBROOnMwalefq
	CwbMj7zAKzmObwvA+w1/D+ofwuEBCnlDGMLRXyjWFlbSTp7Dgn0LxgKVHhCGbbdZwfmqHT41FXc
	NDPLgZtaGFuw0GhSqU0KscXGShuMTXWwRluL95BmofQmeArDlmKDoFHlfjNsBan4AJEykXMTkVZ
	EMMB+XtBHx021+0CqvPPPJGctsuAHuZCtUTWXrb34u4udObXD0UILKQiOGKYBtAjCtUwLWSGUhL
	qTkHxZabxxOkRYcoSCgnu8GXX05XjEjJVnLgSlYCvMX8J+JHY7OLG2W5/B0l1ZNfmWLLOw==
X-Received: by 2002:a05:7022:20e:b0:127:5c57:cffc with SMTP id
 a92af1059eb24-1278fc1f980mr5546302c88.26.1772572719385; Tue, 03 Mar 2026
 13:18:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303172949.4741-1-fmancera@suse.de>
In-Reply-To: <20260303172949.4741-1-fmancera@suse.de>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 3 Mar 2026 13:18:28 -0800
X-Gm-Features: AaiRm50uYKOI7nxXxDuzBrnNN3EjwAriC15_wrOdsD4-O8mxMJY_UZ265TaI5So
Message-ID: <CAAVpQUChu=Wr91kjQz9cWzFmJwrWXz-SsLoD75J3prEKswE43g@mail.gmail.com>
Subject: Re: [PATCH net-next v3] inet: add ip_local_port_step_width sysctl to
 improve port usage distribution
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chia-yu.chang@nokia-bell-labs.com, 
	idosch@nvidia.com, willemb@google.com, dsahern@kernel.org, 
	ncardwell@google.com, skhan@linuxfoundation.org, corbet@lwn.net, 
	horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, 
	davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 9:30=E2=80=AFAM Fernando Fernandez Mancera
<fmancera@suse.de> wrote:
>
> With the current port selection algorithm, ports after a reserved port
> range or long time used port are used more often than others [1]. This
> causes an uneven port usage distribution. This combines with cloud
> environments blocking connections between the application server and the
> database server if there was a previous connection with the same source
> port, leading to connectivity problems between applications on cloud
> environments.
>
> The real issue here is that these firewalls cannot cope with
> standards-compliant port reuse. This is a workaround for such situations
> and an improvement on the distribution of ports selected.
>
> The proposed solution is to implement a variant of RFC 6056 Algorithm 5.
> The step size is selected randomly on every connect() call ensuring it
> is a coprime with respect to the size of the range of ports we want to
> scan. This way, we can ensure that all ports within the range are
> scanned before returning an error. To enable this algorithm, the user
> must configure the new sysctl option "net.ipv4.ip_local_port_step_width".
>
> In addition, on graphs generated we can observe that the distribution of
> source ports is more even with the proposed approach. [2]
>
> [1] https://0xffsoftware.com/port_graph_current_alg.html
>
> [2] https://0xffsoftware.com/port_graph_random_step_alg.html
>
> Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
