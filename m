Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DD427A476
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223796; cv=pass; b=YgSP4guafF69AxF3w+ue/GzXKyFbg6KM2mLvrlxKNxMeVfyqDGQ7ma04ETFWYnwaMwxZNSiSwr+5zTT0IJSAYvTBRPQF81MEuxYT+bDAz1pp0H7lRBe7KfgiAii/sCx60T8ukc0UbKJJ4XgyjOa6S/OUGSQ4WfUAMAHV2c9740M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223796; c=relaxed/simple;
	bh=eZXiOYa+YgIWyQo8nyeElJuGHQ+T9jb0HyxCBdh7xOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IqsTu6YgDX2Dy8HY27e5DRvrpKW7CA0Gihv13LypRO/sUjIgPTYl2lfnSVumrI06SHBN8IgHCnN/yDVTJzxNFyTCPBmFGNEJeskY7eohCart8iLSJW0pMEwZtpw+01zUp/Th0X7/ls5cZwk9Br9N9WAD5FTJjcOry16sFx7l3H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=azWpJzhZ; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="azWpJzhZ"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-506251815a3so518051cf.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 08:49:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770223795; cv=none;
        d=google.com; s=arc-20240605;
        b=BClbjDQiOcAOszS5Ez3sMWi6xxzjrFShfh4hjfEepxr8rQmCY6LwPlETeZCAdOSq8d
         l5btt/RyCjrxyv14ssOrEPKs/S4Y3Q0Db3sxOvMMWxs9+6/Iq6N7S1Hrw4OuD2hvi471
         Hhq71DQRoWSNJevcs0vvkWvWwOnMStpD2K2rjAeEoe1Pd8EtMTdk3O3HUhYJ+kP9gHq7
         Al9jfNA+sbNuEVSY0fEfMrpFl5oytOC7cG9gUsBp1R/mKK9yHGGrs0lj7asw4oPXauA+
         ihNqsCjv3X7/FS2/5ItvjyNWrBamII9k8qefA/whSUU6fCR9q7ARsD/+UgucQb7kclrq
         +m1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aRe0x1M46EJ4CWG3+IrlJG0CiJmZlofy/BFJHcRR0q8=;
        fh=JSPIpVyDmcC7P1y5rokS9l4LTt/gAhLQ9i75N2ygOyI=;
        b=lvkt376ZCIMU5P2a3nLBaPKrdgFyuXVAAve1fo7lHpy+EWfIlW3lb5gVgs/WFUOj0Z
         ASXZBijRM4QY3fqs/hTc1yZAJUGR3QJ46Hh1zYk/70LwI36swTfnbkCMzH9f8RjiTiYj
         +oC0nkZadEuhHcW58WA6kjfklvGsd4w6GJiLUG247L6yEylFeEbIippH3LHbjXgVi6jH
         ffY0AvvuFEo2VKUUqHTxH7e72+n4T7NND0FGntfUMyXkOmQWPJhHSatkyK0JkumA+s7h
         add2aoWV3ZXpFQQBlVTYcAuPLeK32YCQGrraY14eC13Q5NExywIBgBrfp/bChtyG00ti
         U40w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770223795; x=1770828595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRe0x1M46EJ4CWG3+IrlJG0CiJmZlofy/BFJHcRR0q8=;
        b=azWpJzhZTGWMPhDaAQfiQaRGDmGOWhVUfFRIZQPBKZjvgcTdnECA555WolpQdCpc+f
         LtigsJMIsMq61dQ55wVLxeYLRiEVbS/PF71fymilpR5ghoo6ZaCC0rSd6c60QQfGGSmq
         059VWPX/f8u6nHmrj8Woy+NIy8exe7XxaX2E0NqEd8Y3Ep8gNOBH4YmxtYBAhs/Kqsga
         U66cgi+Atmwpa7mME9MUTr2Ejapr88KbM2Z0j6eDxSXlas/2gKmzB2GmrEzQAePofMIn
         BenxbXJyb8Gx0y5RW1F6lvV4v/cAiDemPQ1Mj3dLi1BVaIfsv5dt3fHlEDEEUxQR69SK
         4GEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770223795; x=1770828595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aRe0x1M46EJ4CWG3+IrlJG0CiJmZlofy/BFJHcRR0q8=;
        b=Tc4Cicvxbap8LRuG7Co1dNU/tR1jQlG6Vae+44xR0+DVWvpLDxzFeSpd8GxNdAKE3l
         ZH5LlD+jf9LrLJshBdcJp06o/v/Ppb//GKf32baw15oxBaMPcQudVTgC8jSjnMlrtsBR
         T1357NcXPCWp4fRT4pI6biuCU+AY2E7DUU4LsZ+B8DalPgdjhPYEvsmpe7tV18bBLzjM
         QbzEZpfOFc9aAxGcyXhi4Cz09erzYPQogGCT293MWmS51GFCz5OYdky0tUZ3rYd0e5+2
         S+tRH4gI41h8MNyryE7nY2gWqxN9m2RzT6DvwSBD8XvUbLlcueODDjlzjDHdrGKfUdK/
         cuWA==
X-Forwarded-Encrypted: i=1; AJvYcCVhW7gZKEMPzYTujFmlkrQeanEpKxXxvaL+gGVb900hATTiHbEUzkJjEdj3M2WL4tZzL9H6HBNYedU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRe4BIYE4kVIKNf2HyFUZ3KHRBLCwFbtEJBVYmwlKbnUNAl0RI
	ikLM2hJW7MYzpIHYeunVfDaXYJKw2RfjxhIiM/ZhFNNNVbMLXfESmJF7PIQ+fPjlP8JCoESRORw
	tRuy29AID3/+NnFVv7cL3SG0CJPKTjMD/VkvcRyp+
X-Gm-Gg: AZuq6aKy/Jfz4kRVafJ/oFq4SQ1yPSVcTRhQ7Ohx/OoMVebCim51onKXqqk06vVzAJH
	/+cQ0Gzob5SP2k2OEp7We0P4Paqn/BT/xGCWKtNKK2f8Q9caGoEVyWNT1P/ujUlr5D0fHew0r2A
	JbKpdxcyJZf8m7ZTnkPkbFBP2dPEKimwFleXC0pFZPNNaJIvV9I1z87OTm2+8TkBIyE5w3JzGeD
	9kOIJ+mke8OtGTPRgAAdWM0Wx6xgKWD2v8sHs8dtHl6GNNBUh6UdcTbmkOC4R82RmdbG9gGRPar
	P+Gj
X-Received: by 2002:ac8:738d:0:b0:506:2041:13d6 with SMTP id
 d75a77b69052e-50620411977mr19815381cf.50.1770223795133; Wed, 04 Feb 2026
 08:49:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203175422.4620-1-fmancera@suse.de>
In-Reply-To: <20260203175422.4620-1-fmancera@suse.de>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 4 Feb 2026 17:49:43 +0100
X-Gm-Features: AZwV_Qj44cJ2ota2FAwO0HxsFEHXk2i5sKfOjlzY5l8m1_UEPSbTa3YebqEmj5Y
Message-ID: <CANn89i+UUWx5OhPnJnDhiCfr53BPTAGedBucgqYwyfqkidf_Cg@mail.gmail.com>
Subject: Re: [PATCH RFC net-next] inet: add ip_retry_random_port sysctl to
 reduce sequential port retries
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, ncardwell@google.com, 
	kuniyu@google.com, dsahern@kernel.org, idosch@nvidia.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thorsten Toepper <thorsten.toepper@sap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 6:54=E2=80=AFPM Fernando Fernandez Mancera
<fmancera@suse.de> wrote:
>
> With the current port selection algorithm, ports after a reserved port
> or long time used port are used more often than others. This combines
> with cloud environments blocking connections between the application
> server and the database server if there was a previous connection with
> the same source port. This leads to connectivity problems between
> applications on cloud environments.
>
> The situation is that a source tuple is usable again after being closed
> for a maximum lifetime segment of two minutes while in the firewall it's
> still noted as existing for 60 minutes or longer. So in case that the
> port is reused for the same target tuple before the firewall cleans up,
> the connection will fail due to firewall interference which itself will
> reset the activity timeout in its own table. We understand the real
> issue here is that these firewalls cannot cope with standards-compliant
> port reuse. But this is a workaround for such situations and an
> improvement on the distribution of ports selected.
>
> The proposed solution is instead of incrementing the port number,
> performing a re-selection of a new random port within the remaining
> range. This solution is configured via sysctl new option
> "net.ipv4.ip_retry_random_port".
>
> The test run consists of two processes, a client and a server, and loops
> connect to the server sending some bytes back. The results we got are
> promising:
>
> Executed test: Current algorithm
> ephemeral port range: 9000-65499
> simulated selections: 10000000
> retries during simulation: 14197718
> longest retry sequence: 5202
>
> Executed test: Proposed modified algorithm
> ephemeral port range: 9000-65499
> simulated selections: 10000000
> retries during simulation: 3976671
> longest retry sequence: 12
>
> In addition, on graphs generated we can observe that the distribution of
> source ports is more even with the proposed patch.
>
> Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
> Tested-by: Thorsten Toepper <thorsten.toepper@sap.com>
> ---
>  .../networking/net_cachelines/netns_ipv4_sysctl.rst        | 1 +
>  include/net/netns/ipv4.h                                   | 1 +
>  net/ipv4/inet_hashtables.c                                 | 7 ++++++-
>  net/ipv4/sysctl_net_ipv4.c                                 | 7 +++++++
>  4 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rs=
t b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
> index beaf1880a19b..c4041fdca01e 100644
> --- a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
> +++ b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
> @@ -47,6 +47,7 @@ u8                              sysctl_tcp_ecn
>  u8                              sysctl_tcp_ecn_fallback
>  u8                              sysctl_ip_default_ttl                   =
                                             ip4_dst_hoplimit/ip_select_ttl
>  u8                              sysctl_ip_no_pmtu_disc
> +u8                              sysctl_ip_retry_random_port
>  u8                              sysctl_ip_fwd_use_pmtu                  =
     read_mostly                             ip_dst_mtu_maybe_forward/ip_sk=
b_dst_mtu
>  u8                              sysctl_ip_fwd_update_priority           =
                                             ip_forward
>  u8                              sysctl_ip_nonlocal_bind
> diff --git a/include/net/netns/ipv4.h b/include/net/netns/ipv4.h
> index 2dbd46fc4734..d04b07e7c935 100644
> --- a/include/net/netns/ipv4.h
> +++ b/include/net/netns/ipv4.h
> @@ -156,6 +156,7 @@ struct netns_ipv4 {
>
>         u8 sysctl_ip_default_ttl;
>         u8 sysctl_ip_no_pmtu_disc;
> +       u8 sysctl_ip_retry_random_port;
>         u8 sysctl_ip_fwd_update_priority;
>         u8 sysctl_ip_nonlocal_bind;
>         u8 sysctl_ip_autobind_reuse;
> diff --git a/net/ipv4/inet_hashtables.c b/net/ipv4/inet_hashtables.c
> index f5826ec4bcaa..f1c79a7d3fd3 100644
> --- a/net/ipv4/inet_hashtables.c
> +++ b/net/ipv4/inet_hashtables.c
> @@ -1088,8 +1088,13 @@ int __inet_hash_connect(struct inet_timewait_death=
_row *death_row,
>         for (i =3D 0; i < remaining; i +=3D step, port +=3D step) {
>                 if (unlikely(port >=3D high))
>                         port -=3D remaining;
> -               if (inet_is_local_reserved_port(net, port))
> +               if (inet_is_local_reserved_port(net, port)) {
> +                       if (net->ipv4.sysctl_ip_retry_random_port) {
> +                               port =3D low + get_random_u32_below(remai=
ning);
> +                               port =3D ((port & 1) =3D=3D step) ? port =
: (port - 1);
> +                       }

What happens when almost  all ephemeral ports are in use, and
hundreds of ports are reserved ?

Choosing a random value each time we meet a reserved port is going to
be quite expensive,
and we might return an error from this function even if there are many
available ports.

Perhaps randomly select @step one time at the beginning of this
function so that  @step/2 and @remaining/2
are relatively prime numbers.
