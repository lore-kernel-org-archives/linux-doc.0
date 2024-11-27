Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E68D18C03E
	for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2024 23:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732749323; cv=none; b=qkIF+zpl2AUfobfMEpay1vF9DcZTCKDzxButXvZ+2FOsW1K2D7cUPjgy0Nynqp/ZjbXcvGW1Ug52a31Xkha0f2OR5ES7aLI4XWPy4VB/pe/O4ACLBVabqfmNk6C8lLfe2l2FZYVpy+caY0UaVboSQyRh+wrvOYO0G26qeOSQze0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732749323; c=relaxed/simple;
	bh=+jPnjmSkIWnfw1ypNxPAHk3jExZky9QC/KYnqBebpVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUbiyAZD+lXJ5UTBlGBDcx6mWSERY9cZQqZD5m96mTMEixPCtlHdIYrrFA1y6kPAHjkmDB8iQA3gObcA/nmLnEaghDkB1EU4Z0FYPmc39JJxcIeb39TqoKO1qlrNpYQkxfOjlXHQj2E9UipPoHiUeLJgLsyEd7RwLg9xNxNfRSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FuVotEQd; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FuVotEQd"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e9ed2dbfc8so47223a91.1
        for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2024 15:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732749321; x=1733354121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYut6aU/zn0xLVmf0unpLL5mLReSDppc7n+P3njEiRE=;
        b=FuVotEQdl/FB+TAFPewoIiIaBsvRSMEPXS88ETAb32BINXuhOwMk20qi83g4OeGfUf
         5cjSZBPaeZ7hoo0SJWnuhTO1IWDZBUlFiCocTNJ1guGJcAge7jyhRsX5VxzdGM9BISxh
         Iompgt+tyXqkEJ1oWUgMso9sxZ+RAFRSChaIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732749321; x=1733354121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYut6aU/zn0xLVmf0unpLL5mLReSDppc7n+P3njEiRE=;
        b=EEN5zI5YPw34BsLQpchb33npkLiIP+QB4wDh353ljZIp8ridY5jas70wyQdlx8Qj3+
         FCpbOjupbJUBLNOF944I4qjAUftUK8d0jtgzPa3iCAFAoLTfcoTKViRFrrlbIpHEZ/9R
         LRIIUMGLkMO78DYIbVR6xKbOx08UXA7CHelyu1R//CBr/aNsGl3p8xc4O1S3kIqf2k5w
         Eo51Y4ISbpOY0C0plJEQAWitsERahxN0yYUP/6IgJ8XEnaklgWgJnhEM8JFBUIIVbhIR
         gDWBY30oGDNQ5b3jem3I02NEdWfuroQUC5h9Jz0GJU1tlDw6Q2ZV8N4ivleW9HwZBc1R
         FX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4ml1qrx1M9yyEBMcW6kYllRlDUSuakadUyPqgDlSpPTAzddcz1EdNtAD6AINa2/GkevyFFZAAE+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJQCV6j1M5jEIS2MwQlJlofiUK4VY4wQIEb5tA70hH/19L9FaA
	B1++//tx6GR44Ab4fsDeP+AYSKQR9af+8GJNEmif/CKR6lrR27lZ1/v17PCWc8QB6pX0/v7kNMB
	UL2FE
X-Gm-Gg: ASbGncvNSHzfpVT0HCxipGewHOPiNVGgtvSTn+Pcp7m7r4N2SGq4I6dkGonuE2801U6
	brLr+KGWjH6rTZA794DVuyA5zy06Lu+7Lg5Cb7+DVLcJLTsohPdX8iKm9Azmx7p2cEEZcCTcxEJ
	pxYdUgSxdTOT+AhD1v0jp9TwyGmcSyZ9lYet4DX4411DtIomccTEtXzJB2uCx6fk4di+Xf3f88y
	TyMv1wH5AjDYT2eZu1GWvj7O47EJB3kTVo2b/Rf5MgNL3YQFOx3+CtSNgSDkM/pgxznK+iv/NzQ
	jX0OkJC77Pfa9ShZSw==
X-Google-Smtp-Source: AGHT+IHzgBXgPi7WFMxqLKGdEH74qkL3EKLmuroikloEfTufBNxWS4cx3JYXlLipynETdRXPzgE+pQ==
X-Received: by 2002:a17:90b:3508:b0:2ea:b2d7:4a24 with SMTP id 98e67ed59e1d1-2ee09809df6mr2611570a91.8.1732749321266;
        Wed, 27 Nov 2024 15:15:21 -0800 (PST)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee08c1dc92sm1304118a91.0.2024.11.27.15.15.18
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 15:15:20 -0800 (PST)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21207f0d949so1845545ad.2
        for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2024 15:15:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYWj34vxq2N7lcSqAhzPD9Ok2zy1rHLEnra62ULP9orN2tVacx5tlAzK0PJ6cnFBx6Hbfcv4NOUPw=@vger.kernel.org
X-Received: by 2002:a17:902:f382:b0:212:655c:caf with SMTP id
 d9443c01a7336-21501e5af92mr39560115ad.55.1732749318060; Wed, 27 Nov 2024
 15:15:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127025728.3689245-1-yuanchu@google.com> <20241127025728.3689245-10-yuanchu@google.com>
In-Reply-To: <20241127025728.3689245-10-yuanchu@google.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Wed, 27 Nov 2024 15:14:52 -0800
X-Gmail-Original-Message-ID: <CABVzXAnbSeUezF_dqk2=6HGTCd09T4rd6AssP7-dbCgZSkZgiw@mail.gmail.com>
Message-ID: <CABVzXAnbSeUezF_dqk2=6HGTCd09T4rd6AssP7-dbCgZSkZgiw@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] virtio-balloon: add workingset reporting
To: Yuanchu Xie <yuanchu@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Khalid Aziz <khalid.aziz@oracle.com>, 
	Henry Huang <henry.hj@antgroup.com>, Yu Zhao <yuzhao@google.com>, 
	Dan Williams <dan.j.williams@intel.com>, Gregory Price <gregory.price@memverge.com>, 
	Huang Ying <ying.huang@intel.com>, Lance Yang <ioworker0@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Daniel Watson <ozzloy@each.do>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 7:00=E2=80=AFPM Yuanchu Xie <yuanchu@google.com> wr=
ote:
[...]
> diff --git a/include/linux/workingset_report.h b/include/linux/workingset=
_report.h
> index f6bbde2a04c3..1074b89035e9 100644
> --- a/include/linux/workingset_report.h
> +++ b/include/linux/workingset_report.h
[...]
> diff --git a/include/uapi/linux/virtio_balloon.h b/include/uapi/linux/vir=
tio_balloon.h
> index ee35a372805d..668eaa39c85b 100644
> --- a/include/uapi/linux/virtio_balloon.h
> +++ b/include/uapi/linux/virtio_balloon.h
> @@ -25,6 +25,7 @@
>   * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY=
 WAY
>   * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY O=
F
>   * SUCH DAMAGE. */
> +#include "linux/workingset_report.h"
>  #include <linux/types.h>
>  #include <linux/virtio_types.h>
>  #include <linux/virtio_ids.h>

This seems to be including a non-uapi header
(include/linux/workingset_report.h) from a uapi header
(include/uapi/linux/virtio_balloon.h), which won't compile outside the
kernel. Does anything in the uapi actually need declarations from
workingset_report.h?

> @@ -37,6 +38,7 @@
>  #define VIRTIO_BALLOON_F_FREE_PAGE_HINT        3 /* VQ to report free pa=
ges */
>  #define VIRTIO_BALLOON_F_PAGE_POISON   4 /* Guest is using page poisonin=
g */
>  #define VIRTIO_BALLOON_F_REPORTING     5 /* Page reporting virtqueue */
> +#define VIRTIO_BALLOON_F_WS_REPORTING  6 /* Working Set Size reporting *=
/
>
>  /* Size of a PFN in the balloon interface. */
>  #define VIRTIO_BALLOON_PFN_SHIFT 12
> @@ -128,4 +130,32 @@ struct virtio_balloon_stat {
>         __virtio64 val;
>  } __attribute__((packed));
>
> +/* Operations from the device */
> +#define VIRTIO_BALLOON_WS_OP_REQUEST 1
> +#define VIRTIO_BALLOON_WS_OP_CONFIG 2
> +
> +struct virtio_balloon_working_set_notify {
> +       /* REQUEST or CONFIG */
> +       __le16 op;
> +       __le16 node_id;
> +       /* the following fields valid iff op=3DCONFIG */
> +       __le32 report_threshold;
> +       __le32 refresh_interval;
> +       __le32 idle_age[WORKINGSET_REPORT_MAX_NR_BINS];
> +};
> +
> +struct virtio_balloon_working_set_report_bin {
> +       __le64 idle_age;
> +       /* bytes in this bucket for anon and file */
> +       __le64 anon_bytes;
> +       __le64 file_bytes;
> +};
> +
> +struct virtio_balloon_working_set_report {
> +       __le32 error;
> +       __le32 node_id;
> +       struct virtio_balloon_working_set_report_bin
> +               bins[WORKINGSET_REPORT_MAX_NR_BINS];
> +};
> +
>  #endif /* _LINUX_VIRTIO_BALLOON_H */

Have the spec changes been discussed in the virtio TC?

Thanks,
-- Daniel
