Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1R2f3ug9"
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407291710
	for <linux-doc@vger.kernel.org>; Fri,  8 Dec 2023 14:10:04 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-35d5a3cdbf7so24365ab.0
        for <linux-doc@vger.kernel.org>; Fri, 08 Dec 2023 14:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702073403; x=1702678203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq8sLZY529fpZyvYcaaHG7aerxfsju32DEaOISOYWys=;
        b=1R2f3ug9nTIVeV4qd2MJ90MwIDAgYzXtosGKPI8WwaHoKLhl3iv1OZRDdQf5vSrNlZ
         8eHyGOmmhu26kHqeyXJYoNfp/NdhEq9MiiZ8VXw6FSq8DQbNKy+z/tjVQRA5pD+QUtku
         xP7/tdnxSOcDZYNatvQ9RbioBWKGzrfMx9Y8Q75ccxjbFB2JJW5W9MRUlmbmNIh8oVcZ
         5R/zgGLq5N47dIdqoL+5Isx+M1HgSknhidgEpPorEolU1LvWXGIHz0pQNAhb6sgHo6rJ
         yAxbq8CItOs5rkRgRvqT29qz8Qb6KgEIcyRLfkFgk53Ex+sWdsHabKKep4dpIjjT1A9x
         krjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702073403; x=1702678203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yq8sLZY529fpZyvYcaaHG7aerxfsju32DEaOISOYWys=;
        b=LZTQBdkoBEtiNDFMr1aychbxE/hC52BJH2Lnr3lenobBycggqMTWAR1em68Whpqe+z
         h5mGvgaSi9XyvLDVPDjD2ZsyPprWgeK5VZfjA0wkDBpm4HhRwNKSLzG6NFnuf9D1MwnW
         FrmtrXeas9aIzqtLMh4aEIMUPfBFgMR+Q6MNk30dx2wWvysZV2+T7fGJJF2s/0890Xjm
         WQ7ranjP89Bd9ysOadtZdSvuywtSRsdgRdHN2lIDb6TSlEwsBMxHIdTVBZD6o8Jtew7w
         wLP0oa5psLZC58cf3ZXOexD62MbRlz1XyOcGyobUa3GZ6UU2HMZiatM0VBDtBT1XjUdt
         MHCQ==
X-Gm-Message-State: AOJu0YxmjFTJkdpNQmTKpwasLMKkGhqXSq7kXoP4AeDcLRDtPksQUNQV
	Vm82OVCdlg/Jj/uAbA19fKy2dBiofKS3a2kd6bsE7A==
X-Google-Smtp-Source: AGHT+IF+7j3OGuA6M1m1GklJP1yo6EP7HkZ23ytD0eEL4vpAJ88qnrNWtxyHiYrK17I7SJvwBMPxSHB9bsYkWIrc+PI=
X-Received: by 2002:a92:c52c:0:b0:35c:efe7:e9fa with SMTP id
 m12-20020a92c52c000000b0035cefe7e9famr285633ili.23.1702073403543; Fri, 08 Dec
 2023 14:10:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201214737.104444-1-tony.luck@intel.com> <20231207195613.153980-1-tony.luck@intel.com>
 <20231207195613.153980-2-tony.luck@intel.com> <CALPaoCji1yzfkA=tms3LhYMvRB+wSJQM3qzPKrHNEa7a+KduTA@mail.gmail.com>
 <ZXORTTIUKWXOsd9p@agluck-desk3>
In-Reply-To: <ZXORTTIUKWXOsd9p@agluck-desk3>
From: Peter Newman <peternewman@google.com>
Date: Fri, 8 Dec 2023 14:09:52 -0800
Message-ID: <CALPaoCj_OvMzD8W9+jEORewwDquM6F-sOW32Ngcy+Gm6A1+OcQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] x86/resctrl: Add mount option "mba_MBps_event"
To: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org, 
	Shaopeng Tan <tan.shaopeng@fujitsu.com>, James Morse <james.morse@arm.com>, 
	Jamie Iles <quic_jiles@quicinc.com>, Babu Moger <babu.moger@amd.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 1:57=E2=80=AFPM Tony Luck <tony.luck@intel.com> wrot=
e:
>
> On Fri, Dec 08, 2023 at 10:17:08AM -0800, Peter Newman wrote:
> > Hi Tony,
> >
> > On Thu, Dec 7, 2023 at 11:56=E2=80=AFAM Tony Luck <tony.luck@intel.com>=
 wrote:
> > > @@ -2715,7 +2723,25 @@ static int rdt_parse_param(struct fs_context *=
fc, struct fs_parameter *param)
> > >         case Opt_mba_mbps:
> > >                 if (!supports_mba_mbps())
> > >                         return -EINVAL;
> > > -               ctx->enable_mba_mbps =3D true;
> > > +               if (is_mbm_local_enabled())
> > > +                       ctx->enable_mba_mbps_local =3D true;
> > > +               else
> > > +                       return -EINVAL;
> > > +               return 0;
> > > +       case Opt_mba_mbps_event:
> > > +               if (!supports_mba_mbps())
> > > +                       return -EINVAL;
> > > +               if (!strcmp("mbm_local_bytes", param->string)) {
> > > +                       if (!is_mbm_local_enabled())
> > > +                               return -EINVAL;
> > > +                       ctx->enable_mba_mbps_local =3D true;
> > > +               } else if (!strcmp("mbm_total_bytes", param->string))=
 {
> > > +                       if (!is_mbm_total_enabled())
> > > +                               return -EINVAL;
> > > +                       ctx->enable_mba_mbps_total =3D true;
> > > +               } else {
> > > +                       return -EINVAL;
> >
> > It looks like if I pass
> > "mba_MBps_event=3Dmbm_total_bytes,mba_MBps_event=3Dmbm_local_bytes" I c=
an
> > set both flags true.
>
> That's going to be confusing. I'll add code to stop the user from
> passing both options.

Also kind of confusing, after reading the second patch, I realized
"mba_MBps_event=3Dmbm_total_bytes,mba_MBps" also results in both being
set. If you're able to fail the mount operation if both flags somehow
get set, that would address this one too.

-Peter
