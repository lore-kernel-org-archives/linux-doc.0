Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FEE30F91
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 21:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uzjc4i9R"
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44862133
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 14:06:32 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3575da42138so7585ab.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 14:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698267991; x=1698872791; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YfKUQfUVw2J0FwzBs8kRktoJX+okfytV+T+B1kRuBio=;
        b=Uzjc4i9Rw9syaHUHEzJ+R+rqVahROI2kY8UxdD3VMs7SMIA2KCDXIThzUVtRv2HuzT
         mRmt8kqehxt6FnN0hViy7d27MvNaJFzEx8DDXiizgt19Mz5As48mp9iZJ6eBFQETkXUG
         acS25QB184H3tszqJ5l4CmXeSmwxOVi+q4Mtc3vtFr//B2S8RzMBXjcyYfuSyx3cxGeq
         ZE7DgTHyJMzbr4UwEaz37oRDXd7T1B6s85IO8QypyWb1rCHCAf6Uh1GFetRR90YzL3sw
         tANFInQnsP52z0T9Jtcq51/sp5Z4Vz9esA1N+ucXctSf7ofeAcdxF3r0WhZHc0Bvj4wF
         DhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698267991; x=1698872791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfKUQfUVw2J0FwzBs8kRktoJX+okfytV+T+B1kRuBio=;
        b=ZluIdHLhv/kZ2SWr3Iqbkb10SvE5P1Vj81nLvFi7+hknQcSVJsJNZBTW4ztkrK/xaz
         +fiawF5hzbxWl/NWgqc+j3Dy7G1y9YwTsQIGI5SuYlkWRO77Ss30dUUF6aHvJjcVCSHi
         QWe8/ZVYEQIK+SrRbBMc/MKzT/SnDunO+Ug+k439pgsMnWbUuuwEHhTbJx2pRX5cjMjK
         5myxOiJVbygqMphk+ckfcueWEWDRP9zx5dyZEYmnzp5fs5zrKR8aJjPAdrMUGpihT845
         iECrVjC/AZzJsYC9sTRzJELrARDoS7vds+xP44S541aPZFwA+uXMpCY0qUkJYvt4yASW
         ghvw==
X-Gm-Message-State: AOJu0YwYeyaImqzSRVvy7oasavsyfViaa2n1xqG8AT/ENM3Jv6ECh6wm
	re7jBNOVwoLE5E5Cp6U/zw3mMClwaK1/tlJJzySSFg==
X-Google-Smtp-Source: AGHT+IEH7+hN0UnU2m4b/Gl5oLvAf7k4M9Ve15jrFHBr/Sc2DlZfGnPuEjrzAsXX50m1rLP8WUI0gf8alcW5t9Zj81w=
X-Received: by 2002:a05:6e02:b24:b0:357:cb1a:9621 with SMTP id
 e4-20020a056e020b2400b00357cb1a9621mr375512ilu.10.1698267991544; Wed, 25 Oct
 2023 14:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231024181600.8270-1-tony.luck@intel.com> <CALPaoChftF-H6GauKq4-c_qBJP1GJbR3-ByE5krsaQF4y4y9oQ@mail.gmail.com>
 <ZTluypa9bCWv4k2n@agluck-desk3>
In-Reply-To: <ZTluypa9bCWv4k2n@agluck-desk3>
From: Peter Newman <peternewman@google.com>
Date: Wed, 25 Oct 2023 23:06:20 +0200
Message-ID: <CALPaoCj72V=o60tqsFMRzaeUw-1+rN7pyhsdCyVEV=0tN_CZ7A@mail.gmail.com>
Subject: Re: [PATCH] x86/resctrl: mba_MBps: Fall back to total b/w if local
 b/w unavailable
To: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org, 
	Shaopeng Tan <tan.shaopeng@fujitsu.com>, James Morse <james.morse@arm.com>, 
	Jamie Iles <quic_jiles@quicinc.com>, Babu Moger <babu.moger@amd.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Tony,

On Wed, Oct 25, 2023, 21:38 Tony Luck <tony.luck@intel.com> wrote:
>
> On Wed, Oct 25, 2023 at 02:46:53PM +0200, Peter Newman wrote:
>
> > > +static struct mbm_state *get_mbm_data(struct rdt_domain *dom_mbm, int rmid)
> > > +{
> > > +       if (is_mbm_local_enabled())
> > > +               return &dom_mbm->mbm_local[rmid];
> > > +
> > > +       return &dom_mbm->mbm_total[rmid];
> > > +}
> >
> > That looks very similar to the get_mbm_state() function I added to
> > this same file recently:
> >
> > https://lore.kernel.org/all/20221220164132.443083-2-peternewman%40google.com
> >
> > I think the name you picked is misleadingly general. "local if
> > available, otherwise total" seems to be a choice specific to the mbps
> > controller. I think these functions should be reconciled a little
> > better.
> >
>
> Peter (and Babu, who made the same point about get_mbm_state().
>
> Do you want to see your function extended to do the "pick an MBM event?"

What I meant was I think it would be enough to just give the function
you added a name that's more specific to the Mbps controller use case.
For example, get_mba_sc_mbm_state().

It's only problematic that you added a function with an equivalent
name to an existing function that does something different.

-Peter
