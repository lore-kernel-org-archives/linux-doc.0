Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72164A1D
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 11:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737719150; cv=none; b=f8KF2wf3SDbRImvxk3tH9UYu0g7/2lTxXEG02YKjHN3Aj6j2bMUnMsXd2Rzbfp5ddzgGY0i8f6YLgKS48cR3BKYm5v+GBQZBWJIkIkCl19dpuBv+ZCo178ocTmOiN8uuAL/P1IDW0LKriYY0mwzIQtVqjh1glNomsqfsfxzFQUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737719150; c=relaxed/simple;
	bh=zW/EazKbI+/IIPptYdIXFZX/gpcmxVKJO/Qx43m8AGw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hqrTkQ7G7r6g5JRLYclxWeSLbbV2LnLa6/qCgOPicgYu/ImudOsoCUqZ15HMtNQEHhZoQYOVkZ378KM/HDcl7YjUrbAXNyt9OuV5FYd89OIIkzWcyiaWgPqptL49sFy/R6PRqAkPEwSzFxE/ahCwt++05raEeusXSTSqp3Q0MuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CWBAJjAZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CWBAJjAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737719147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=odeNkl2pdZWzjMRmLzJX8QVcRedjnH492ZzohS0yuak=;
	b=CWBAJjAZyQwlmRFwm7JzOJC10iIvoLzLKD7cY7FBZNfkT3F8OE36kyYJvQHfDd9G/NbW4/
	BolTIDEcRRUnN36rV6Q/PuG+3mOCfaX7/QPqft4gjiaRyGoaPQfXEfwv5LaIY51Ggo5F6q
	1ahGwCoeazodd2cpMvgJkdHvDgzf32s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-ezVLRtwAOmWTd6QbVFuB0A-1; Fri, 24 Jan 2025 06:45:46 -0500
X-MC-Unique: ezVLRtwAOmWTd6QbVFuB0A-1
X-Mimecast-MFC-AGG-ID: ezVLRtwAOmWTd6QbVFuB0A
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d3f01eeef8so1690912a12.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 03:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737719145; x=1738323945;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odeNkl2pdZWzjMRmLzJX8QVcRedjnH492ZzohS0yuak=;
        b=Qe4YxpL0E1aQhmfkr5QzfxzTZaLkIRtNqFUngxrljRxmzfq5FnhZSyKk4bKstSTIeG
         enCtXxkk3hl2cBSXJRgMNatqVjILi6yujo1ylhhiM0KvNyJG+NasdB6XLqdFgukg0NMI
         oHCzHpUSOQU6epizZLiG34OgzRvESURCsZKCWppEUUSWAHnjhdDO3d3BkuqToaLttmCs
         PdCwl4Bh0zPLe1Zo/gO429e3jaDTQ340zupdXpgWsdCVG5LSLgp8SFelaRrQPXeMDYKv
         04Xsz8yoXtqYC2Q0e8J7ytRq0FY9IG+f3rTokeEsdA6Q3hE0FDzr5SLyDbzLKY0OGXSh
         aShg==
X-Forwarded-Encrypted: i=1; AJvYcCWQWJRDtD95OBCd7CbyuT1c91Yv7iUrChWqUKMWkqZTSCASa2EE4H0VdtnPOXttAkm/mGOeBx+GUUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg6WOQJOOmXqvwp4jkF/NSTebKdDyirOhnvrrnIEZs+dwN/Wly
	pnbpq9c7z6SvVYTMuX0vGsroELHEEtli/XuYVkU2FgyZ+M6oN5vFsvd95B0jFA89U/k4pRjIdIg
	RTUsO8D1bHz9siYHGEdcpwH7MjT0CnzuCvCTmNIoAxKRwV2B4luvddjaABg==
X-Gm-Gg: ASbGnct4DZWhNAResCsRqUrusMbj989wfgef/q2ZYDuLJ4yaS12W/DwirPjXQe3idJQ
	CLJcpvknAZ/Yp8Sj3D3yCzzMk4Sk3nKGSK8UvHmJ3TKd6hcqRt5KIyb7MzpSjk4nUiDj/xOKFLV
	pGMfNpUG75WxNQ2paGiCbN5hQ1NCtaLdmuBo+KsSyvA1H+ItEpDJ4P680iddRJeo66BtYuYDdCc
	zGtjm65Z5sH6jtsg/svoblAj6eTjbhz/HaYBepGGTcG8HTZJm3S+fUM/GZFmaM6g/LY0ZLxP7nL
	9oAWsWHCIHgO499FNac=
X-Received: by 2002:a05:6402:1e8e:b0:5dc:1059:6b2 with SMTP id 4fb4d7f45d1cf-5dc105a5ec1mr11805772a12.7.1737719144984;
        Fri, 24 Jan 2025 03:45:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeWFYBPETVo309BerlvPgux0XnsYsjMKjnLErW6dJ05V2oA4Fpf2Q3nZFN4K3N5AK1bx4cSA==
X-Received: by 2002:a05:6402:1e8e:b0:5dc:1059:6b2 with SMTP id 4fb4d7f45d1cf-5dc105a5ec1mr11805656a12.7.1737719144333;
        Fri, 24 Jan 2025 03:45:44 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760ab1d7sm117046766b.109.2025.01.24.03.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:45:43 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 9DF17180AA6E; Fri, 24 Jan 2025 12:45:42 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Stanislav Fomichev <stfomichev@gmail.com>, Florian Bezdeka
 <florian.bezdeka@siemens.com>
Cc: "Song, Yoong Siang" <yoong.siang.song@intel.com>, "Bouska, Zdenek"
 <zdenek.bouska@siemens.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Willem
 de Bruijn <willemb@google.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Bjorn Topel <bjorn@kernel.org>,
 "Karlsson, Magnus" <magnus.karlsson@intel.com>, "Fijalkowski, Maciej"
 <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
 <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, "Damato,
 Joe" <jdamato@fastly.com>, Stanislav Fomichev <sdf@fomichev.me>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Mina Almasry <almasrymina@google.com>,
 Daniel Jurgens <danielj@nvidia.com>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Mykola Lysenko <mykolal@fb.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose
 Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>, "Kitszel, Przemyslaw"
 <przemyslaw.kitszel@intel.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "intel-wired-lan@lists.osuosl.org"
 <intel-wired-lan@lists.osuosl.org>, "xdp-hints@xdp-project.net"
 <xdp-hints@xdp-project.net>
Subject: Re: [xdp-hints] Re: [PATCH bpf-next v6 4/4] igc: Add launch time
 support to XDP ZC
In-Reply-To: <Z5KdSlzmyCKUyXTn@mini-arch>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-5-yoong.siang.song@intel.com>
 <AS1PR10MB5675499EE0ED3A579151D3D3EBE02@AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM>
 <PH0PR11MB583095A2F12DA10D57781D18D8E02@PH0PR11MB5830.namprd11.prod.outlook.com>
 <ea087229cc6f7953875fc69f1b73df1ae1ee9b72.camel@siemens.com>
 <Z5KdSlzmyCKUyXTn@mini-arch>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 24 Jan 2025 12:45:42 +0100
Message-ID: <87bjvwqvtl.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stanislav Fomichev <stfomichev@gmail.com> writes:

> On 01/23, Florian Bezdeka wrote:
>> Hi all,
>> 
>> On Thu, 2025-01-23 at 16:41 +0000, Song, Yoong Siang wrote:
>> > On Thursday, January 23, 2025 11:40 PM, Bouska, Zdenek <zdenek.bouska@siemens.com> wrote:
>> > > 
>> > > Hi Siang,
>> > > 
>> > > I tested this patch series on 6.13 with Intel I226-LM (rev 04).
>> > > 
>> > > I also applied patch "selftests/bpf: Actuate tx_metadata_len in xdp_hw_metadata" [1]
>> > > and "selftests/bpf: Enable Tx hwtstamp in xdp_hw_metadata" [2] so that TX timestamps
>> > > work.
>> > > 
>> > > HW RX-timestamp was small (0.5956 instead of 1737373125.5956):
>> > > 
>> > > HW RX-time:   595572448 (sec:0.5956) delta to User RX-time sec:1737373124.9873 (1737373124987318.750 usec)
>> > > XDP RX-time:   1737373125582798388 (sec:1737373125.5828) delta to User RX-time sec:0.0001 (92.733 usec)
>> > > 
>> > > Igc's raw HW RX-timestamp in front of frame data was overwritten by BPF program on
>> > > line 90 in tools/testing/selftests/bpf: meta->hint_valid = 0;
>> > > 
>> > > "HW timestamp has been copied into local variable" comment is outdated on
>> > > line 2813 in drivers/net/ethernet/intel/igc/igc_main.c after
>> > > commit 069b142f5819 igc: Add support for PTP .getcyclesx64() [3].
>> > > 
>> > > Workaround is to add unused data to xdp_meta struct:
>> > > 
>> > > --- a/tools/testing/selftests/bpf/xdp_metadata.h
>> > > +++ b/tools/testing/selftests/bpf/xdp_metadata.h
>> > > @@ -49,4 +49,5 @@ struct xdp_meta {
>> > >                __s32 rx_vlan_tag_err;
>> > >        };
>> > >        enum xdp_meta_field hint_valid;
>> > > +       __u8 avoid_IGC_TS_HDR_LEN[16];
>> > > };
>> > > 
>> > 
>> > Hi Zdenek Bouska, 
>> > 
>> > Thanks for your help on testing this patch set.
>> > You are right, there is some issue with the Rx hw timestamp,
>> > I will submit the bug fix patch when the solution is finalized,
>> > but the fix will not be part of this launch time patch set.
>> > Until then, you can continue to use your WA.
>> 
>> I think there is no simple fix for that. That needs some discussion
>> around the "expectations" to the headroom / meta data area in front of
>> the actual packet data.
>
> By 'simple' you mean without some new UAPI to signal the size of that
> 'reserved area' by the driver? I don't see any other easy way out as well :-/

Yeah, I don't think we can impose UAPI restrictions on the metadata area
at this point. I guess the best we can do is to educate users that they
should call the timestamp kfunc before they modify the metadata?

-Toke

