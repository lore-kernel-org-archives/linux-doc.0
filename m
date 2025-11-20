Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37AF2EB85E;
	Thu, 20 Nov 2025 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648307; cv=none; b=rGRia82RBbvfYFR5NBBX+FC5yQVsqqzzU5PIaUVuSJHAoHQILiidO27Q7FLxw+kP4vXwjZjQ+PEi2qfd3N2qEblRvhqA1rxs8y0RwOQCd0dfIVZKmBtRUtDmADloPW85oti4NhLUJoCfJkMoTTyM1zax8s/jyNtylbPSFEUgNXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648307; c=relaxed/simple;
	bh=ZLS41exRKE5qu/hVv6DGisDbpmmHU0pk6twxweo+BmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nyn8yd26xWreS25Bl0KAIby8ETXx0YIysRKYx5gry5lrPxCkPASeK4VsZmiVmxrl+Kl3PFiXRBKYi5zWiWfbBoEPQjR41cZGBepideGAww6Ws2UMO2iP/rzCw9raIxdUhq68aD62J1D/CreAaEgIHb0v9l+6BUBqb9psA43cY0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A03C5339;
	Thu, 20 Nov 2025 06:18:16 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C40EF3F740;
	Thu, 20 Nov 2025 06:18:23 -0800 (PST)
Date: Thu, 20 Nov 2025 14:18:21 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 03/13] coresight: Refactor
 etm4_config_timestamp_event()
Message-ID: <20251120141821.GA724103@e132581.arm.com>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-3-82efd7b1a751@linaro.org>
 <CAJ9a7VhYaU=kAtvZtSnkj-9OicCWwqYQBX4Q3zDtCay-8=Y7Cg@mail.gmail.com>
 <4090a47c-2208-486b-bd96-47518d7aa90c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4090a47c-2208-486b-bd96-47518d7aa90c@linaro.org>

On Thu, Nov 20, 2025 at 01:52:03PM +0000, James Clark wrote:

[...]

> > > +       config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
> > > +                                   FIELD_PREP(TRCCNTCTLRn_RLDSEL_MASK, ETM_RES_SEL_FALSE) |
> > > +                                   FIELD_PREP(TRCCNTCTLRn_CNTSEL_MASK, ETM_RES_SEL_TRUE);
> > > 
> > 
> > So if we define generic event generators:-
> > 
> > #define ETM4_SEL_RS_PAIR BIT(7)
> > #defiine ETM4_RS_SEL_EVENT_SINGLE(rs_sel_idx) (GENMASK(4:0) & rs_sel_idx)
> > #define ETM4_RS_SEL_EVENT_PAIR(rs_sel_pair_idx) ((GENMASK(3:0) &
> > rs_sel_pair_idx) | ETM4_SEL_RS_PAIR)
> > 
> > these are then reuseable for all registers that need the 8 bit event
> > selectors, beyond just this register.
> > 
> > Thus we now accurately define the fields in the TRCCNTCTLRn
> > 
> > #define TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
> > 
> > and use
> > 
> > FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,
> > ETM4_RS_SEL_EVENT_SINGLE(ETM_RES_SEL_FALSE))
> > 
> > etc.
> > 
> > 
> 
> I'm not sure I agree with that, the Arm ARM has CNTEVENT_TYPE as a regular
> bit in the TRCCNTCTLRn register so it should be set like any other. Hiding
> it as a subfield of "EVENT" when it always exists and always does the same
> thing was maybe seen as a bad decision which is why it was updated?
> 
> Also IMO, beyond using labels instead of raw numbers, the code should just
> show what's programmed into the register. ETM4_RS_SEL_EVENT_SINGLE() would
> be one more macro to jump through to see what's actually happening.

Maybe define a general macro but with extra checking:

  #define TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)

  #define ETM4_RS_SEL_EVENT(paired, sel) ({  \
      if (paired)                            \
          assert(!(sel & ~GENMASK(3, 0)));   \
      else                                   \
          assert(!(sel & ~GENMASK(4, 0)));   \
      FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,  \
                 ((paird << 7) | sel));      \
  })

Thanks,
Leo
